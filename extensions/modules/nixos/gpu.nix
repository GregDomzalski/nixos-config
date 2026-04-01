{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.hardware.gpu;
in {
  options.hardware.gpu = {
    vendor = mkOption {
      type = types.nullOr (types.enum [ "nvidia" "amd" "intel" ]);
      default = null;
      description = "GPU vendor for automatic driver configuration";
    };

    enableAcceleration = mkOption {
      type = types.bool;
      default = true;
      description = "Enable hardware graphics acceleration";
    };

    enable32BitSupport = mkOption {
      type = types.bool;
      default = true;
      description = "Enable 32-bit driver support for gaming/Wine";
    };
  };

  config = mkMerge [
    # Common graphics configuration for all GPUs
    (mkIf (cfg.vendor != null) {
      hardware.graphics = {
        enable = cfg.enableAcceleration;
        enable32Bit = cfg.enable32BitSupport;
      };
    })

    # NVIDIA-specific configuration
    (mkIf (cfg.vendor == "nvidia") {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        open = false;
        modesetting.enable = true;
        powerManagement.enable = mkDefault false;
        powerManagement.finegrained = mkDefault false;
      };

      # Hardware video acceleration for NVIDIA
      hardware.graphics.extraPackages = with pkgs; [
        nvidia-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    })

    # AMD-specific configuration
    (mkIf (cfg.vendor == "amd") {
      services.xserver.videoDrivers = [ "amdgpu" ];

      # AMD AMDVLK (official AMD Vulkan driver)
      hardware.amdgpu.amdvlk = {
        enable = mkDefault true;
        support32Bit.enable = cfg.enable32BitSupport;
      };

      # Hardware video acceleration for AMD
      hardware.graphics.extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
        libva-vdpau-driver
        libvdpau-va-gl
      ];

      # Mesa OpenCL for compute
      environment.systemPackages = with pkgs; [
        clinfo
        rocmPackages.clr
      ];
    })

    # Intel-specific configuration
    (mkIf (cfg.vendor == "intel") {
      services.xserver.videoDrivers = [ "modesetting" ];

      # Hardware video acceleration for Intel
      hardware.graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
        intel-compute-runtime
      ];

      environment.systemPackages = with pkgs; [
        intel-gpu-tools
      ];
    })
  ];
}

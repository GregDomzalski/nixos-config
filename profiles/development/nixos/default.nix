{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  options.profiles.development = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable development tools profile";
    };

    android = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Android development tools";
      };
    };

    reverseEngineering = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable reverse engineering tools (Ghidra, ImHex)";
      };
    };

    networkAnalysis = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable network analysis tools (Wireshark)";
      };
    };

    virtualisation = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable containerization tools";
      };

      backend = mkOption {
        type = types.enum [ "docker" "podman" ];
        default = "docker";
        description = "Container runtime to use";
      };
    };

    bluetoothDev = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Bluetooth development tools (nRF)";
      };
    };
  };

  imports = [
    ./android.nix
    ./reverse-engineering.nix
    ./network-analysis.nix
    ./virtualisation.nix
    ./bluetooth-dev.nix
    ./local-certs.nix
  ];

  config = mkIf cfg.enable {
    # Empty - all config in imports
  };
}

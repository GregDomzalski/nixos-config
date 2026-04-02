{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  options.profiles.development = {
    enable = mkEnableOption "development tools profile";

    android = {
      enable = mkEnableOption "Android development tools";
    };

    reverseEngineering = {
      enable = mkEnableOption "reverse engineering tools (Ghidra, ImHex)";
    };

    networkAnalysis = {
      enable = mkEnableOption "network analysis tools (Wireshark)";
    };

    virtualisation = {
      enable = mkEnableOption "containerization tools";

      backend = mkOption {
        type = types.enum [ "docker" "podman" ];
        default = "docker";
        description = "Container runtime to use";
      };
    };

    bluetoothDev = {
      enable = mkEnableOption "Bluetooth development tools (nRF)";
    };
  };

  imports = [
    ./android.nix
    ./reverse-engineering.nix
    ./network-analysis.nix
    ./virtualisation.nix
    ./bluetooth-dev.nix
  ];

  config = mkIf cfg.enable {
    # Empty - all config in imports
  };
}

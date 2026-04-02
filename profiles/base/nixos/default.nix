{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  options.profiles.base = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable base system profile (required for all systems)";
    };

    boot = {
      loader = mkOption {
        type = types.enum [ "systemd-boot" "grub" ];
        default = "systemd-boot";
        description = "Boot loader to use";
      };

      timeout = mkOption {
        type = types.int;
        default = 2;
        description = "Boot menu timeout in seconds";
      };
    };

    fonts = {
      enable = mkEnableOption "font configuration" // { default = true; };
    };

    locale = {
      timezone = mkOption {
        type = types.str;
        default = "America/New_York";
        description = "System timezone";
      };

      defaultLocale = mkOption {
        type = types.str;
        default = "en_US.UTF-8";
        description = "Default locale";
      };
    };

    networking = {
      networkManager = {
        enable = mkEnableOption "NetworkManager" // { default = true; };

        dns = mkOption {
          type = types.str;
          default = "systemd-resolved";
          description = "DNS backend for NetworkManager";
        };
      };

      firewall = {
        enable = mkEnableOption "firewall" // { default = true; };

        checkReversePath = mkOption {
          type = types.str;
          default = "loose";
          description = "Reverse path filtering mode";
        };
      };
    };

    nix = {
      flakes = mkEnableOption "flakes" // { default = true; };

      autoGC = {
        enable = mkEnableOption "automatic garbage collection" // { default = true; };

        options = mkOption {
          type = types.str;
          default = "--delete-older-than 30d";
          description = "Garbage collection options";
        };
      };
    };

    openssh = {
      enable = mkEnableOption "OpenSSH server" // { default = false; };

      passwordAuth = mkOption {
        type = types.bool;
        default = false;
        description = "Enable password authentication";
      };
    };
  };

  imports = [
    ./nix.nix
    ./fonts.nix
    ./locale.nix
    ./boot.nix
    ./networking.nix
    ./openssh.nix
  ];

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.boot.loader == "systemd-boot" || cfg.boot.loader == "grub";
        message = "Boot loader must be either systemd-boot or grub";
      }
    ];
  };
}

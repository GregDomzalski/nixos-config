{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  options.profiles.desktop = {
    enable = mkEnableOption "desktop environment profile";

    plasma = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable KDE Plasma 6";
      };

      wayland = mkOption {
        type = types.bool;
        default = true;
        description = "Use Wayland session instead of X11";
      };

      excludePackages = mkOption {
        type = types.listOf types.package;
        default = with pkgs.kdePackages; [ konsole elisa discover ];
        description = "KDE packages to exclude from installation";
      };
    };

    sddm = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable SDDM display manager";
      };

      autoNumlock = mkOption {
        type = types.bool;
        default = true;
        description = "Enable numlock on SDDM startup";
      };
    };

    audio = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable PipeWire audio";
      };

      backend = mkOption {
        type = types.enum [ "pipewire" "pulseaudio" ];
        default = "pipewire";
        description = "Audio backend to use";
      };
    };

    printing = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable CUPS printing";
      };
    };

    touchpad = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable touchpad configuration";
      };

      naturalScrolling = mkOption {
        type = types.bool;
        default = true;
        description = "Enable natural scrolling on touchpad";
      };
    };

    onepassword = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable 1Password integration";
      };
    };

    apps = {
      libreoffice = {
        enable = mkOption {
          type = types.bool;
          default = false;
          description = "Enable LibreOffice suite";
        };
      };

      communication = {
        enable = mkOption {
          type = types.bool;
          default = false;
          description = "Enable communication apps (Signal, Zoom)";
        };
      };

      media = {
        enable = mkOption {
          type = types.bool;
          default = false;
          description = "Enable media apps (VLC, etc)";
        };
      };
    };
  };

  imports = [
    ./plasma.nix
    ./audio.nix
    ./printing.nix
    ./touchpad.nix
    ./1password.nix
    ./apps
  ];

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = !(config.profiles.server.enable or false);
        message = "Desktop and server profiles are mutually exclusive";
      }
    ];

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}

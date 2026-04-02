{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  options.profiles.desktop = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable desktop home-manager profile";
    };

    plasma = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable KDE Plasma home manager configuration";
      };
    };

    ghostty = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Ghostty terminal emulator";
      };
    };

    browsers = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Firefox and Chromium browsers";
      };
    };

    onepassword = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable 1Password home-manager integration";
      };
    };

    obsidian = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Obsidian note-taking application";
      };
    };

    remmina = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Remmina remote desktop client";
      };
    };

    syncthing = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Syncthing file synchronization";
      };
    };
  };

  imports = [
    ./plasma.nix
    ./ghostty.nix
    ./browsers.nix
    ./1password.nix
    ./obsidian.nix
    ./remmina.nix
    ./syncthing.nix
  ];

  config = mkIf cfg.enable {
    # Empty - all config in imports
  };
}

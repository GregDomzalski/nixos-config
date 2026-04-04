{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  options.profiles.development = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable development home-manager profile";
    };

    ssh = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable SSH client configuration";
      };
    };

    claudeCode = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Claude Code IDE";
      };
    };

    vscode = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable VSCode editor";
      };
    };

    chromium = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable Chromium browser with work apps";
      };
    };

    creative = {
      enable = mkOption {
        type = types.bool;
        default = cfg.enable;
        description = "Enable creative applications (GIMP, Inkscape, Krita, Darktable)";
      };
    };
  };

  imports = [
    ./ssh.nix
    ./claude-code.nix
    ./vscode.nix
    ./chromium.nix
    ./creative.nix
  ];

  config = mkIf cfg.enable {
    # Empty - all config in imports
  };
}

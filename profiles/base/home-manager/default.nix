{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  options.profiles.base = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable base home-manager profile (required for all users)";
    };

    shell = {
      enable = mkEnableOption "shell configuration" // { default = true; };
    };

    git = {
      enable = mkEnableOption "git configuration" // { default = true; };
    };
  };

  imports = [
    ./shell.nix
    ./git.nix
  ];

  config = mkIf cfg.enable {
    # Empty - all config in imports
  };
}

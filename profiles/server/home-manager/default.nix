{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.server;
in {
  options.profiles.server = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable server home-manager profile";
    };
  };

  config = mkIf cfg.enable {
    # Minimal home-manager configuration for server systems
  };
}

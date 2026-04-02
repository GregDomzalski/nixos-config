{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.syncthing.enable) {
    services.syncthing = {
      enable = true;

      settings = {
        devices = {
          # TODO
        };

        folders = {
          # TODO
        };

        options = {
          localAnnounceEnabled = false;
          relaysEnabled = false;
          urAccepted = -1; # No usage data collection
        };
      };
    };
  };
}

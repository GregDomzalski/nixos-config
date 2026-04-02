{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.touchpad.enable) {
    services.libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = cfg.touchpad.naturalScrolling;
      };
    };
  };
}

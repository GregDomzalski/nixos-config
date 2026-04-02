{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.remmina.enable) {
    services.remmina = {
      enable = true;
    };
  };
}

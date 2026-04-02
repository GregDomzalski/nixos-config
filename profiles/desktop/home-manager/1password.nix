{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.onepassword.enable) {
    xdg.autostart = {
      enable = true;
      entries = [
        "${pkgs._1password-gui}/share/applications/1password.desktop"
      ];
    };
  };
}

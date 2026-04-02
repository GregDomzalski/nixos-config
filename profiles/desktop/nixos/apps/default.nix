{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      (optionals cfg.apps.libreoffice.enable [
        libreoffice-qt
      ])
      ++ (optionals cfg.apps.communication.enable [
        signal-desktop
        zoom
      ])
      ++ (optionals cfg.apps.media.enable [
        vlc
      ]);
  };
}

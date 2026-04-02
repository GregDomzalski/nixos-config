{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf (cfg.enable && cfg.fonts.enable) {
    fonts = {
      enableDefaultPackages = false;

      packages = with pkgs; [
        geist-font
        ibm-plex
        inter
        nerd-fonts.jetbrains-mono
        noto-fonts
        noto-fonts-color-emoji
      ];

      fontconfig.enable = true;
      fontconfig.defaultFonts = {
        sansSerif = [ "Geist" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}

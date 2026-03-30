# configuration.nix
{ config, lib, pkgs, ... }:

{
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
      monospace = [ "JetBrainsMono Nerd Font"];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
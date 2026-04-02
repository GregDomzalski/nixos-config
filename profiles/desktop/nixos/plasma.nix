{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.plasma.enable) {
    services.displayManager.sddm = mkIf cfg.sddm.enable {
      enable = true;
      wayland.enable = cfg.plasma.wayland;
      autoNumlock = cfg.sddm.autoNumlock;
    };

    services.desktopManager.plasma6.enable = true;

    environment.plasma6.excludePackages = cfg.plasma.excludePackages;

    environment.systemPackages = with pkgs; [
      # KDE packages
      kdePackages.kate
      kdePackages.kcalc
      kdePackages.kcharselect
      kdePackages.kcolorchooser
      kdePackages.ksystemlog
      kdePackages.sddm-kcm
      kdePackages.isoimagewriter
      kdePackages.partitionmanager

      # Render SVG icons
      kdePackages.qtsvg

      # Mounting network shares in Dolphin
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras

      hardinfo2
      wayland-utils
      wl-clipboard
    ];
  };
}

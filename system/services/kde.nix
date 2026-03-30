{ config, lib, pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
      };
    };

    desktopManager.plasma6.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konsole
    kdePackages.elisa
    kdePackages.discover
  ];
}

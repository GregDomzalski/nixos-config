# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  # System-wide packages that aren't available as NixOS modules
  # with their own configuration.
  environment.systemPackages = with pkgs; [
    # LibreOffice
    libreoffice-qt

    # Tools
    imhex
    wget
    vlc
    wireshark
    openssl_3
    gum

    # nRF Bluetooth utilities
    nrfutil
    nrfconnect
    nrf-udev
    nrf5-sdk

    # Communication
    signal-desktop
    zoom-us

    # Services
    networkmanager
    networkmanagerapplet
    wireguard-tools
  ];

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [

    ];
  };
}

{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "grd-workstation";
    
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    firewall.checkReversePath = "loose";
  };

  services.resolved.enable = true;
}

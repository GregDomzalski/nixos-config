{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "grd-laptop";
    
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    firewall.checkReversePath = "loose";
  };

  services.resolved.enable = true;
}

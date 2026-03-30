{ config, lib, pkgs, ... }:

{
  boot.initrd = {
    enable = true;
    systemd.enable = true;
    verbose = false;
  };
}

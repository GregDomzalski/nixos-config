{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}

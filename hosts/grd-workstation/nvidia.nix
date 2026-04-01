{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    enable = true;
    open = true;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}

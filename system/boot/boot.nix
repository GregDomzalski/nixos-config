{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      timeout = 2;
      efi.canTouchEfiVariables = false;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}

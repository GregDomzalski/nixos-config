{ lib, inputs, outputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Set GPU vendor for automatic driver configuration
  hardware.gpu.vendor = "nvidia";
}

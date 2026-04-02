{ lib, inputs, outputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Set GPU vendor for automatic driver configuration
  hardware.gpu.vendor = "nvidia";

  # NixOS release version when this system was first installed
  # This value should NOT be changed after initial installation
  system.stateVersion = "25.11";

  # TEMP
  networking.extraHosts = ''
    127.0.0.1 app.mimick.local api.mimick.local auth.mimick.local
  '';
}

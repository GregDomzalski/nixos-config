{ lib, inputs, outputs, ... }:
{
  imports = [
    ./boot
    ./environment
    ./networking
    ./programs
    ./services
    ./virtualisation
    ./fonts.nix
    ./locale.nix
    ./nixsettings.nix
    ];
}

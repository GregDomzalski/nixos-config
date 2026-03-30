{ lib, inputs, outputs, ... }:
{
  imports = [
    ./boot.nix
    ./initrd.nix
    ./plymouth.nix
    ./systemd-boot.nix
    ];
}

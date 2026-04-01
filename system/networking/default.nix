{ lib, inputs, outputs, ... }:
{
  imports = [
    # ./net-dhcp.nix
    ./networking.nix
    # ./wifi-networks.nix
    # ./wireguard.nix
    ];
}

{ lib, inputs, outputs, ... }:
{
  imports = [
    ./1password.nix
    ./ghidra.nix
    ./wireshark.nix
    ];
}

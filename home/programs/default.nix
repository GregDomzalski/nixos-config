{ lib, inputs, outputs, ... }:
{
  imports = [
      ./browsers.nix
      ./claude-code.nix
      ./git.nix
      ./obsidian.nix
      ./plasma.nix
      ./remmina.nix
      ./shell.nix
      ./ssh.nix
      ./syncthing.nix
      ./vscode.nix
    ];
}
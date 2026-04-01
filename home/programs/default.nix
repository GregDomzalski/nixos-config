{ lib, inputs, outputs, ... }:
{
  imports = [
      ./1password.nix
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
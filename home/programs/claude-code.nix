{ config, lib, pkgs, ... }:

{
  programs.claude-code = {
    enable = true;

    # https://mynixos.com/home-manager/options/programs.claude-code
    mcpServers = {
      nixos = {
        type = "stdio";
        command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
      };
    };
  };

  home.packages = [
    pkgs.claude-monitor
    pkgs.mcp-nixos
  ];
}
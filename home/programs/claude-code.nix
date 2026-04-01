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

  # Workaround for Claude Code plugin marketplace SSH issue
  # Ref: https://github.com/anthropics/claude-code/issues/26588
  # This rewrites SSH URLs to HTTPS only for the claude-plugins-official
  # repository, allowing the plugin marketplace to work with 1Password SSH agent
  programs.git.settings.url."https://github.com/anthropics/claude-plugins-official" = {
    insteadOf = "git@github.com:anthropics/claude-plugins-official";
  };

  home.packages = [
    pkgs.claude-monitor
    pkgs.mcp-nixos
  ];
}
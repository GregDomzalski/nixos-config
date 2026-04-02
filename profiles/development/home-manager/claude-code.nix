{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.claudeCode.enable) {
    programs.claude-code = {
      enable = true;

      mcpServers = {
        nixos = {
          type = "stdio";
          command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
        };
      };
    };

    # Workaround for Claude Code plugin marketplace SSH issue
    programs.git.settings.url."https://github.com/anthropics/claude-plugins-official" = {
      insteadOf = "git@github.com:anthropics/claude-plugins-official";
    };

    home.packages = [
      pkgs.claude-monitor
      pkgs.mcp-nixos
    ];
  };
}

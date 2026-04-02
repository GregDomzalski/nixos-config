{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.vscode.enable) {
    programs.vscode = {
      enable = true;
      profiles = {
        default = {
          enableUpdateCheck = false;

          userSettings = {
            "chat.disableAIFeatures" = true;
            "editor.renderWhitespace" = "all";
            "editor.rulers" = [ 80 120 ];
            "telemetry.enableTelemetry" = false;
            "telemetry.enableCrashReporter" = false;
            "breadcrumbs.enabled" = true;
            "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
            "editor.fontSize" = 14;
            "editor.fontLigatures" = true;
            "editor.lineHeight" = 1.5;

            "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font Mono'";
          };

          extensions = [
            pkgs.vscode-extensions.jnoortheen.nix-ide
            pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
            pkgs.vscode-extensions.ms-vscode-remote.remote-containers
            pkgs.vscode-extensions.editorconfig.editorconfig
            pkgs.vscode-extensions.codezombiech.gitignore
            pkgs.vscode-extensions.foxundermoon.shell-format
          ];
        };
      };
    };
  };
}

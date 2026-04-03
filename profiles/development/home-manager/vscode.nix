{ config, lib, pkgs, username, hostname, ... }:

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
            "breadcrumbs.enabled" = true;
            "chat.commandCenter.enabled" = false;
            "chat.disableAIFeatures" = true;
            "diffEditor.experimental.showMoves" = true;
            "diffEditor.experimental.useTrueInlineView" = true;
            "editor.accessibilitySupport" = "off";
            "editor.aiStats.enabled" = false;
            "editor.emptySelectionClipboard" = false;
            "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
            "editor.fontLigatures" = true;
            "editor.fontSize" = 14;
            "editor.formatOnPaste" = true;
            "editor.lineHeight" = 1.5;
            "editor.renderWhitespace" = "all";
            "editor.rulers" = [ 80 120 ];
            "explorer.confirmDelete" = false;
            "extensions.autoCheckUpdates" = false;
            "extensions.ignoreRecommendations" = false;
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";
            "nix.serverSettings" = {
              nixd = {
                formatting = {
                  command = [ "nixfmt" ];
                };
                options = {
                  nixos = {
                    expr = "(builtins.getFlake \"/home/${username}/Projects/Personal/nixos-config\").nixosConfigurations.${hostname}.options";
                  };
                  home-manager = {
                    expr = "(builtins.getFlake \"/home/${username}/Projects/Personal/nixos-config\").nixosConfigurations.${hostname}.config.home-manager.users.${username}.options";
                  };
                };
              };
            };
            "telemetry.editStats.enabled" = false;
            "telemetry.enableCrashReporter" = false;
            "telemetry.feedback.enabled" = false;
            "telemetry.telemetryLevel" = "off";
            "terminal.integrated.enableImages" = false;
            "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font Mono'";
          };

          extensions = [
            pkgs.vscode-extensions.aaron-bond.better-comments
            pkgs.vscode-extensions.adpyke.codesnap
            pkgs.vscode-extensions.anthropic.claude-code
            pkgs.vscode-extensions.bbenoist.nix
            pkgs.vscode-extensions.bierner.markdown-emoji
            pkgs.vscode-extensions.codezombiech.gitignore
            pkgs.vscode-extensions.codezombiech.gitignore
            pkgs.vscode-extensions.davidanson.vscode-markdownlint
            pkgs.vscode-extensions.docker.docker
            pkgs.vscode-extensions.donjayamanne.githistory
            pkgs.vscode-extensions.editorconfig.editorconfig
            pkgs.vscode-extensions.editorconfig.editorconfig
            pkgs.vscode-extensions.foxundermoon.shell-format
            pkgs.vscode-extensions.github.vscode-github-actions
            # pkgs.vscode-extensions.heaths.vscode-guid
            pkgs.vscode-extensions.jnoortheen.nix-ide
            pkgs.vscode-extensions.mhutchie.git-graph
            # pkgs.vscode-extensions.mk12.better-git-line-blame
            pkgs.vscode-extensions.moshfeu.compare-folders
            pkgs.vscode-extensions.ms-azuretools.vscode-containers
            pkgs.vscode-extensions.ms-azuretools.vscode-docker
            pkgs.vscode-extensions.ms-vscode-remote.remote-containers
            pkgs.vscode-extensions.ms-vscode-remote.remote-containers
            pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
            pkgs.vscode-extensions.ms-vscode-remote.remote-ssh-edit
            pkgs.vscode-extensions.pkief.material-icon-theme
            pkgs.vscode-extensions.redhat.vscode-xml
            pkgs.vscode-extensions.redhat.vscode-yaml
            pkgs.vscode-extensions.streetsidesoftware.code-spell-checker
            pkgs.vscode-extensions.vscode-icons-team.vscode-icons
            pkgs.vscode-extensions.yzhang.markdown-all-in-one
          ];
        };
      };
    };

    home.packages = [
      pkgs.nixd
      pkgs.nixfmt-rfc-style
    ];
  };
}

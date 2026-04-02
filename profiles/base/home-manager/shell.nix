{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf (cfg.enable && cfg.shell.enable) {
    home.shell.enableZshIntegration = true;

    home.packages = with pkgs; [
      fd
      ripgrep
      dust
      bottom
      lazygit
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ls = "eza --icons=always --group-directories-first";
        ll = "eza --icons=always -l --group-directories-first";
        la = "eza --icons=always -la --group-directories-first";
        cat = "bat";
        grep = "rg";
        find = "fd";
        top = "btm";
      };

      history = {
        size = 10000;
        save = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
        ignoreDups = true;
      };
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        format = ''
          ╭─$username$hostname$directory$git_branch$git_status
          ╰─$character'';

        username = {
          format = "[$user]($style)@";
          style_user = "bold blue";
          show_always = true;
        };

        hostname = {
          ssh_only = false;
          format = "[$hostname]($style) ";
          style = "bold green";
        };

        directory = {
          format = "[$path]($style) ";
          style = "bold cyan";
          truncate_to_repo = false;
        };

        git_branch = {
          format = "‹[$branch]($style)› ";
          style = "bold purple";
        };

        git_status = {
          format = "[$all_status$ahead_behind]($style) ";
          style = "bold red";
        };

        character = {
          success_symbol = "[➤](bold green)";
          error_symbol = "[➤](bold red)";
        };
      };
    };

    programs.bat.enable = true;

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        line-numbers = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
    };

    programs.eza = {
      enable = true;
      colors = "auto";
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
}

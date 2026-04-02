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

      initContent = ''
        # SSH hostname completion from ~/.ssh/config
        if [ -f ~/.ssh/config ]; then
          h=()
          h=($(awk '/^Host / {for (i=2; i<=NF; i++) if ($i !~ /[*?]/) print $i}' ~/.ssh/config))
          if [ ''${#h[@]} -gt 0 ]; then
            zstyle ':completion:*:ssh:*' hosts $h
            zstyle ':completion:*:scp:*' hosts $h
            zstyle ':completion:*:sftp:*' hosts $h

            # Enable remote path completion for scp/sftp
            zstyle ':completion:*:(scp|sftp):*' remote-access true
            zstyle ':completion:*:(scp|sftp):*' group-order files all-files hosts-ipaddr hosts

            # Cache remote listings for better performance
            zstyle ':completion:*:(ssh|scp|sftp):*' use-cache yes
            zstyle ':completion:*:(ssh|scp|sftp):*' cache-ttl 3600
          fi
        fi
      '';

      syntaxHighlighting = {
        enable = true;

        # Enable useful highlighters
        highlighters = [ "main" "brackets" "pattern" ];

        # Style configuration aligned with Starship prompt colors
        styles = {
          # Commands - green for valid, red for invalid
          command = "fg=green";
          alias = "fg=green,bold";
          builtin = "fg=green";
          function = "fg=cyan";
          unknown-token = "fg=red,bold";

          # Reserved words and precommands
          reserved-word = "fg=magenta";
          precommand = "fg=yellow,underline";

          # Arguments and strings
          single-quoted-argument = "fg=yellow";
          double-quoted-argument = "fg=yellow";
          dollar-quoted-argument = "fg=yellow";

          # Paths - cyan to match Starship directory style
          path = "fg=cyan";
          path_pathseparator = "fg=blue";
          path_prefix = "fg=cyan,underline";

          # Globbing and expansions
          globbing = "fg=blue,bold";
          history-expansion = "fg=blue";
          command-substitution-delimiter = "fg=magenta";
          process-substitution = "fg=magenta";
          arithmetic-expansion = "fg=magenta";

          # Operators and separators
          commandseparator = "fg=white,bold";
          redirection = "fg=magenta";

          # Options/flags
          single-hyphen-option = "fg=blue";
          double-hyphen-option = "fg=blue";

          # Variables and assignments
          assign = "fg=blue";

          # Comments
          comment = "fg=white,dim";
        };

        # Dangerous command patterns with visual warnings
        patterns = {
          # Extremely dangerous - red background
          "rm -rf*" = "fg=white,bold,bg=red";
          "rm -fr*" = "fg=white,bold,bg=red";
          "git reset --hard*" = "fg=white,bold,bg=red";
          "git clean -fd*" = "fg=white,bold,bg=red";
          "sudo rm -rf*" = "fg=white,bold,bg=red";
          "mkfs.*" = "fg=white,bold,bg=red";

          # Caution needed - yellow background
          "git push --force*" = "fg=black,bold,bg=yellow";
          "git push -f*" = "fg=black,bold,bg=yellow";
          "sudo dd*" = "fg=black,bold,bg=yellow";
          "fdisk*" = "fg=black,bold,bg=yellow";
          "chmod -R*" = "fg=black,bg=yellow";
          "chown -R*" = "fg=black,bg=yellow";
        };
      };

      shellAliases = {
        ls = "eza --icons=always --group-directories-first";
        ll = "eza --icons=always -l --group-directories-first";
        la = "eza --icons=always -la --group-directories-first";
        cat = "bat";
        grep = "rg";
        find = "fd";
        top = "btm";
        cd = "z";
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
          ╭─$username$hostname$directory$nix_shell$git_branch$git_status
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
          format = " 🖿 [$path]($style)[$read_only]($read_only_style) ";
          style = "bold cyan";
          truncate_to_repo = false;
        };

        git_branch = {
          format = "on ‹[$symbol$branch(:$remote_branch)]($style)›  ";
          style = "bold purple";
        };

        git_status = {
          format = "[$all_status$ahead_behind]($style) ";
          conflicted = ">$count conflicts<";
          ahead = "[\($count\)⇡](bold green) ";
          behind = "[⇣\($count\)](bold yellow) ";
          diverged = "[\($ahead_count\)⇡](bold green) [⇣\($behind_count\)](bold yellow) ";
          untracked = "[\($count\)?](bold red) ";
          stashed = "[\($count\)🗁](bold red) ";
          modified = "[\($count\)!](bold yellow) ";
          staged = "[\($count\)+](bold green) ";
          renamed = "[\($count\)»](bold yellow) ";
          deleted = "[\($count\)✘](bold red) ";
          typechanged = "";
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

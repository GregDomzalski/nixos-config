{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.ghostty.enable) {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      installBatSyntax = true;
      settings = {
        adjust-cell-height = "20%";
        adjust-cursor-thickness = "50%";
        font-family = "JetBrainsMono Nerd Font Mono";
        font-size = 12;
        background-opacity = 0.85;
        background-blur = true;
        shell-integration-features = "ssh-env";
        window-show-tab-bar = "always";
      };
    };
  };
}

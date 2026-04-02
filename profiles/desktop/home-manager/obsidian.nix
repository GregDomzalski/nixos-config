{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.obsidian.enable) {
    programs.obsidian = {
      enable = true;
    };
  };
}

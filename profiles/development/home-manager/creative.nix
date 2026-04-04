{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.creative.enable) {
    home.packages = with pkgs; [
      gimp
      inkscape
      krita
      darktable
    ];
  };
}

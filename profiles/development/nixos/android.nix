{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.android.enable) {
    environment.systemPackages = with pkgs; [
      android-studio
      android-studio-tools
      android-tools
    ];
  };
}

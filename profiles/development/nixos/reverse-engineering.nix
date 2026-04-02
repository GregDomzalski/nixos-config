{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.reverseEngineering.enable) {
    programs.ghidra = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      imhex
    ];
  };
}

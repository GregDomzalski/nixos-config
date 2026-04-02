{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.networkAnalysis.enable) {
    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
  };
}

{ config, lib, pkgs, hostname, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf cfg.enable {
    networking = {
      # Set hostname from specialArgs
      hostName = hostname;

      networkmanager = mkIf cfg.networking.networkManager.enable {
        enable = true;
        dns = cfg.networking.networkManager.dns;
      };

      firewall.checkReversePath = cfg.networking.firewall.checkReversePath;
    };

    services.resolved = mkIf cfg.networking.networkManager.enable {
      enable = true;
    };
  };
}

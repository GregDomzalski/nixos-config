{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf (cfg.enable && cfg.openssh.enable) {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = cfg.openssh.passwordAuth;
        PubkeyAuthentication = true;
        PermitRootLogin = "no";
        X11Forwarding = false;
      };
    };
  };
}

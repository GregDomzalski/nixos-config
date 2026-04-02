{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf (cfg.enable && cfg.git.enable) {
    programs.git = {
      enable = true;
      lfs.enable = true;

      settings = {
        user = {
          name = "Greg Domzalski";
          email = "greg@gregdom.com";
        };
      };

      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPoCy9US9dPMpdoSnEChVDET0trbeWIBl6bXE59CD7x1";
        signByDefault = true;
        signer = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
    };
  };
}

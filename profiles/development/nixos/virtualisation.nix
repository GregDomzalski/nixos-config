{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.virtualisation.enable) {
    virtualisation = {
      containers = {
        enable = true;
        registries.search = [ "docker.io" ];
      };

      docker = mkIf (cfg.virtualisation.backend == "docker") {
        enable = true;
      };

      podman = mkIf (cfg.virtualisation.backend == "podman") {
        enable = true;
      };
    };

    users.users.greg.extraGroups = [ "docker" "podman" ];

    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      docker-compose
    ];
  };
}

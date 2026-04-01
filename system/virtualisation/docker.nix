# services/podman.nix

{ config, pkgs, inputs, ... }:
{
  virtualisation = {
    containers = {
      enable = true;
      registries.search = [ "docker.io" ];
    };

    docker = {
      enable = true;
    };
  }; 

  users.users.greg.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    docker-compose
  ];
}
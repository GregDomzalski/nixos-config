{ inputs }:

{
  base = {
    nixosModules = import ./base/nixos;
    homeManagerModules = import ./base/home-manager;
  };

  desktop = {
    nixosModules = import ./desktop/nixos;
    homeManagerModules = import ./desktop/home-manager;
  };

  development = {
    nixosModules = import ./development/nixos;
    homeManagerModules = import ./development/home-manager;
  };

  server = {
    nixosModules = import ./server/nixos;
    homeManagerModules = import ./server/home-manager;
  };
}

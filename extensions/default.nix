{ inputs }:

let
  gregos = import ./lib;
in {
  overlays = {
    default = final: prev: {
      gregos = import ./pkgs { pkgs = final; };
    };
  };

  nixosModules = {
    imports = [
      ./modules/nixos/gpu.nix
    ];

    _module.args = {
      inherit inputs gregos;
    };
  };

  homeManagerModules = {
    imports = [
      ./modules/home-manager/chromium-app.nix
      ./modules/home-manager/chromium-policies.nix
    ];

    _module.args = {
      inherit inputs gregos;
    };
  };
}
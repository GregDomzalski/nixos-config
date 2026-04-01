{ inputs }:

let
  gregos = import ./lib;
in {
  nixosModules = {
    imports = [

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
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    nixos-hardware,
    ...
  } @ inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];

      extensions = import ./extensions { inherit inputs; };

    in {
      nixosConfigurations = {
        grd-laptop = nixpkgs.lib.nixosSystem {

          modules = [ 
            ./system
            ./hosts/grd-laptop
            ./users/greg.nix
            
            nixos-hardware.nixosModules.framework-12th-gen-intel
            extensions.nixosModules

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
 
              home-manager.users.greg = import ./home/greg.nix;

              home-manager.sharedModules = [
                plasma-manager.homeModules.plasma-manager
                extensions.homeManagerModules
                ];
            }
          ];
        };
      };
    };
}

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
      extensions = import ./extensions { inherit inputs; };
    in {
      nixosConfigurations = {

        grd-laptop = let
          username = "greg";
          hostname = "grd-laptop";
          specialArgs = {inherit username hostname; };
        in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [ 
              ./system
              ./hosts/${hostname}
              ./users/${username}.nix

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

        grd-workstation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./system
            ./hosts/grd-workstation
            ./users/greg.nix

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

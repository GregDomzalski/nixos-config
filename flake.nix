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
      gregos = import ./profiles { inherit inputs; };
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
              # Import all profiles
              gregos.base.nixosModules
              gregos.desktop.nixosModules
              gregos.development.nixosModules

              # Enable profiles with feature flags
              {
                profiles.desktop.enable = true;
                profiles.development = {
                  enable = true;
                  android.enable = true;
                  reverseEngineering.enable = true;
                  networkAnalysis.enable = true;
                  virtualisation = {
                    enable = true;
                    backend = "docker";
                  };
                  bluetoothDev.enable = false;
                };
              }

              # Host-specific
              ./hosts/${hostname}
              ./users/${username}

              # Hardware modules
              nixos-hardware.nixosModules.framework-12th-gen-intel
              extensions.nixosModules

              # Home-manager
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.greg = {
                  imports = [
                    gregos.base.homeManagerModules
                    gregos.desktop.homeManagerModules
                    gregos.development.homeManagerModules
                    ./users/${username}/home.nix
                  ];

                  profiles.desktop.enable = true;
                  profiles.development.enable = true;
                };

                home-manager.sharedModules = [
                  plasma-manager.homeModules.plasma-manager
                  extensions.homeManagerModules
                ];
              }
            ];
          };

        grd-workstation = let
          username = "greg";
          hostname = "grd-workstation";
          specialArgs = {inherit username hostname; };
        in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [
              # Import all profiles
              gregos.base.nixosModules
              gregos.desktop.nixosModules
              gregos.development.nixosModules

              # Enable profiles with feature flags
              {
                profiles.desktop.enable = true;
                profiles.development = {
                  enable = true;
                  android.enable = true;
                  reverseEngineering.enable = true;
                  networkAnalysis.enable = true;
                  virtualisation = {
                    enable = true;
                    backend = "docker";
                  };
                  bluetoothDev.enable = true;
                };
              }

              # Host-specific
              ./hosts/${hostname}
              ./users/${username}

              # Hardware modules
              extensions.nixosModules

              # Home-manager
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.greg = {
                  imports = [
                    gregos.base.homeManagerModules
                    gregos.desktop.homeManagerModules
                    gregos.development.homeManagerModules
                    ./users/${username}/home.nix
                  ];

                  profiles.desktop.enable = true;
                  profiles.development.enable = true;
                };

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

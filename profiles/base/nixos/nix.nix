{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf cfg.enable {
    nixpkgs = {
      config = {
        allowUnfree = true;
        segger-jlink.acceptLicense = true;
        android_sdk.accept_license = true;
      };
    };

    nix = {
      settings = {
        experimental-features = "nix-command flakes";
        trusted-users = [ "root" "greg" ];
      };

      gc.automatic = cfg.nix.autoGC.enable;
      gc.options = mkIf cfg.nix.autoGC.enable cfg.nix.autoGC.options;

      optimise.automatic = true;

      registry = (lib.mapAttrs (_: flake: { inherit flake; }))
        ((lib.filterAttrs (_: lib.isType "flake")) inputs);

      nixPath = [ "/etc/nix/path" ];
    };
  };
}

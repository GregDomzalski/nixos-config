{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.server;
in {
  options.profiles.server = {
    enable = mkEnableOption "server profile for headless systems";

    headless = mkOption {
      type = types.bool;
      default = true;
      description = "Disable GUI components";
    };
  };

  imports = [
  ];

  config = mkIf cfg.enable {
    # Enable SSH server by default for server profile
    profiles.base.openssh.enable = mkDefault true;

    assertions = [
      {
        assertion = !(config.profiles.desktop.enable or false);
        message = "Desktop and server profiles are mutually exclusive";
      }
    ];
  };
}

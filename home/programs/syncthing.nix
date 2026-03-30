{ config, lib, pkgs, ... }:

{
  services.syncthing = {
    enable = true;

    settings = {
      devices = {
        # TODO
      };

      folders = {
        # TODO
      };

      options = {
        localAnnounceEnabled = false;
        relaysEnabled = false;
        urAccepted = -1; # No usage data collection
      };
    };
  };
}
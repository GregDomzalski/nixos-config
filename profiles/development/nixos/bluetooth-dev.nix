{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;
in {
  config = mkIf (cfg.enable && cfg.bluetoothDev.enable) {
    environment.systemPackages = with pkgs; [
      nrfutil
      nrfconnect
      nrf-udev
      nrf5-sdk
    ];
  };
}

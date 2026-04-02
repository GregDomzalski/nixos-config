{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.audio.enable) {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = mkIf (cfg.audio.backend == "pipewire") {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}

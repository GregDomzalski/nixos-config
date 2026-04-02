{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf cfg.enable {
    boot = {
      loader = {
        timeout = cfg.boot.timeout;
        efi.canTouchEfiVariables = false;
      };

      kernelPackages = pkgs.linuxPackages_latest;

      initrd = {
        enable = true;
        systemd.enable = true;
        verbose = false;
      };

      loader.systemd-boot = mkIf (cfg.boot.loader == "systemd-boot") {
        enable = true;
        configurationLimit = 10;
        consoleMode = "max";
      };

      # Plymouth boot splash screen
      plymouth = {
        enable = true;
        theme = "flame";
        themePackages = with pkgs; [
          (adi1090x-plymouth-themes.override {
            selected_themes = [ "flame" ];
          })
        ];
      };

      # Silent boot parameters
      consoleLogLevel = 3;
      kernelParams = [
        "quiet"
        "udev.log_level=3"
        "systemd.show_status=auto"
      ];
    };
  };
}

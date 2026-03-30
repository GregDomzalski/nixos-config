{ config, lib, pkgs, ... }:

{
  boot = { 
    plymouth = {
      enable = true;
      theme = "flame";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "flame" ];
        })
      ];
    };

    # Enable "silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };
}

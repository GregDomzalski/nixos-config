{ config, lib, pkgs, ... }:

{
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/root/wifi-passwords.env" ];

    profiles = {
      "GregDom" = {

        connection = {
          id = "GregDom";
          type = "wifi";
          autoconnect = true;
          autoconnect-priority = 999;
        };

        wifi = {
          ssid = "GregDom";
        };

        wifi-security = {
          key-mgmt = "sae";
          psk = "$GREGDOM_WIFI_PSK";
        };

        ipv4 = {
          method = "auto";
        };

        ipv6 = {
          method = "disabled";
        };
      };

      "Moms_House" = {

        connection = {
          id = "Mom's house";
          type = "wifi";
          autoconnect = true;
          autoconnect-priority = 100;
        };

        wifi = {
          ssid = "BGAT";
        };

        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$BGAT_WIFI_PSK";
        };

        ipv4 = {
          method = "auto";
        };

        ipv6 = {
          method = "disabled";
        };
      };
    };
  };
}

{ config, lib, pkgs, ... }:

{
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/root/wireguard-secrets.env" ];

    profiles = {
      "GregDomVPN" = {

        connection = {
          id = "GregDomVPN";
          type = "wireguard";
          interface-name = "GregDomVPN";
        };

        wireguard = {
          private-key = "$GREGDOMVPN_PRIV_KEY";
        };

        "wireguard-peer.gvXn9h/F/G4SMBuFonIm3ZIVpoyGFzIKoDZLB4VgSDM=" = {
          endpoint = "74.109.115.240:51825";
          allowed-ips = "0.0.0.0/0;";
          preshard-key = "$GREGDOMVPN_PSK";
          persistent-keepalive = 25;
        };

        ipv4 = {
          method = "manual";
          addresses = "10.10.11.3/24;";
          dns = "10.10.0.2;";
          dns-search = "~;";
        };

        ipv6 = {
          method = "disabled";
        };
      };

      "CSCVPN" = {

        connection = {
          id = "CSCVPN";
          type = "wireguard";
          interface-name = "CSCVPN";
        };

        wireguard = {
          private-key = "$CSCVPN_PRIV_KEY";
          mtu = 1360;
        };

        "wireguard-peer.D/WqmOU0I35D1zGnghcOobeZARR3vgIU4yb00qSxpgA=" = {
          endpoint = "104.196.100.131:60606";
          allowed-ips = "10.99.0.0/24;10.199.0.0/16;";
          persistent-keepalive = 25;
        };

        ipv4 = {
          method = "manual";
          addresses = "10.199.0.34/24;";
          dns = "10.199.0.1;";
          dns-search = "~wg0.crit.sh;~wg1.crit.sh;~csio.lan;~csc.lan;";
        };

        ipv6 = {
          method = "disabled";
        };
      };
    };
  };
}

{ config, lib, pkgs, modulesPath, ... }:

{
  networking.networkmanager.ensureProfiles.profiles = {
    "Framework-DHCP" = {
      connection = {
        id = "Framework-DHCP";
        type = "ethernet";
        interface-name = "enp0s13f0u1";
      };
      ipv4 = {
        method = "shared";
      };
      ipv6 = {
        method = "disabled";
      };
    };
  };

  networking.firewall.interfaces."enp0s13f0u1".allowedUDPPorts = [ 67 ];

  environment.etc."NetworkManager/dnsmasq-shared.d/client-reservation.conf".text = ''
    # Format: dhcp-host=<MAC-address>,<Desired-IP>
    dhcp-host=2c:cf:67:7b:51,10.42.0.2
  '';
}

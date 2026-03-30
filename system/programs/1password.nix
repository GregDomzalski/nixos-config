{ config, lib, pkgs, ... }:

let
  toml = pkgs.formats.toml {};

  agentConfig = toml.generate "agent.toml" {
    "ssh-keys" = [
      { vault = "Private"; }
      { vault = "HomeInfrastructure"; }
      { vault = "ManagedInfra"; }
    ];
  };
in
{
  programs._1password = {
    enable = true;
  };

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "greg" ];
  };

  systemd.user.tmpfiles.rules = [
    "d  %h/.config/1Password/ssh              0700 - - - -"
    "L+ %h/.config/1Password/ssh/agent.toml   -    - - - ${agentConfig}"
  ];
}

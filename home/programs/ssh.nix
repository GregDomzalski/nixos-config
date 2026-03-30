{ config, lib, pkgs, ... }:
let
  # TODO: Is there a way to automatically discover/reference this
  # from the 1Password package?
  opSocketPath = ".1password/agent.sock";
  knownHostsFile = "~/.ssh/known_hosts";

  pubKeys = {
    "greg_github_auth" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ70ymR9G0z/gNRAwpEUleSWC0z1uhwfFEY4onbYrSiQ";
    "greg_git_signing" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPoCy9US9dPMpdoSnEChVDET0trbeWIBl6bXE59CD7x1";
    "greg_homelab_auth" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPwggmjUJ39tlgLhIMECu0ExVlco2/HqIx9d6gE1E5zf";
  };

  mkPubKeyRule = name: text:
    ''F %h/.ssh/keys/${name}.pub 0600 - - - ${text}'';

in {
  # TODO:
  # - Autocomplete hostnames in zsh

  # Set the permissions on the .ssh and keys directories.
  # This is only needed really for the keys sub-directory.
  # SSH requires strict permissions on its files and folders
  # otherwise it will fail operations.
  systemd.user.tmpfiles.rules = [
    "d %h/.ssh          0700 - - - -"
    "d %h/.ssh/keys     0700 - - - -"
    "d %h/.ssh/control  0700 - - - -"
  ] ++ lib.mapAttrsToList mkPubKeyRule pubKeys;

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/${opSocketPath}";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "desktop" = {
        hostname = "10.10.0.141";
        forwardAgent = true;
      };

      "dockerhost" = {
        hostname = "dockerhost.vm.gregdom.net";
        identityFile = "/home/greg/.ssh/keys/greg_homelab_auth.pub";
        extraOptions = {
          PasswordAuthentication = "no";
          PubkeyAuthentication = "yes";
        };
      };

      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "/home/greg/.ssh/keys/greg_github_auth.pub";
      };

      "*" = {
        compression = false;
        forwardX11 = false;

        hashKnownHosts = false;
        userKnownHostsFile = knownHostsFile;

        controlMaster = "no";
        controlPath = "/home/greg/.ssh/control/master-%r@%n:%p";
        controlPersist = "no";

        serverAliveInterval = 0;
        serverAliveCountMax = 3;

        forwardAgent = false;
        addKeysToAgent = "no";
        identityAgent = "~/${opSocketPath}";
        identitiesOnly = true;
      };
    };
  };
}

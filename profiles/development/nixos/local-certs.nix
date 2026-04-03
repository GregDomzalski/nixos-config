{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development.localCerts;
in {
  options.profiles.development.localCerts = {
    enable = mkOption {
      type = types.bool;
      default = config.profiles.development.enable;
      description = ''
        Enable local development certificate support via mkcert.

        After enabling and rebuilding, run `mkcert -install` to:
        - Create a local CA certificate at ~/.local/share/mkcert/rootCA.pem
        - Install the CA to ~/.pki/nssdb (Chromium's trust store)
        - Make all mkcert-generated certificates trusted by browsers
      '';
    };
  };

  config = mkIf cfg.enable {
    # Install mkcert and NSS tools system-wide
    environment.systemPackages = with pkgs; [
      mkcert    # Tool for creating locally-trusted development certificates
      nss.tools # Provides certutil for managing Chromium's certificate database
    ];

    # Add mkcert CA to system PKI for OpenSSL-based tools (curl, git, etc.)
    # Note: This path won't exist until user runs `mkcert -install`
    security.pki.certificateFiles = mkIf (pathExists "/home/greg/.local/share/mkcert/rootCA.pem") [
      "/home/greg/.local/share/mkcert/rootCA.pem"
    ];
  };
}

{ config, lib, ... }:

with lib;

let
  # A convenient shorthand for your new options
  cfg = config.programs.chromium.apps;
in {
  # 1. Inject your new options into the existing programs.chromium namespace
  options.programs.chromium.apps = mkOption {
    default = { };
    description = "An attribute set of Chromium web apps.";
    type = types.attrsOf (types.submodule {
      options = {
        url = mkOption { 
          type = types.str; 
        };
        icon = mkOption { 
          type = types.str; 
        };
        categories = mkOption { 
          type = types.listOf types.str;
        };
      };
    });
  };

  # 2. Map the configuration back to standard Home Manager options
  config = mkIf (cfg != { }) {
    xdg.desktopEntries = mapAttrs' (name: value: 
      nameValuePair "chrome-${value.url}__-Default" {
        name = name;
        genericName = "${name} web app";
        exec = "chromium --app=https://${value.url} --class=${toLower (replaceStrings [" "] [""] name)}";
        icon = value.icon;
        terminal = false;
        categories = value.categories;
      }
    ) cfg;
  };
}
{ config, lib, pkgs, ... }:

# Options search: https://nix-community.github.io/plasma-manager/options.xhtml
# Get reverse config: nix run github:nix-community/plasma-manager
{
  programs.plasma = {
    enable = true;

    input.keyboard = {
      numlockOnStartup = "on";
    };

    kwin = {
      effects = {
        blur = {
          enable = true;
          noiseStrength = 0;
          strength = 6;
        };

        slideBack.enable = true;
        translucency.enable = true;
        wobblyWindows.enable = true;
      };
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    panels = [
      {
        location = "bottom";
        floating = false;
        lengthMode = "fill";
        opacity = "translucent";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    fonts = {
      general = {
        family = "Geist";
        pointSize = 10;
      };

      fixedWidth = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 10;
      };

      small = {
        family = "Geist";
        pointSize = 8;
      };

      toolbar = {
        family = "Geist";
        pointSize = 10;
      };

      menu = {
        family = "Geist";
        pointSize = 10;
      };

      windowTitle = {
        family = "Geist";
        pointSize = 10;
      };
    };
  };

  #  programs.plasma = {
#    enable = true;
#
#    workspace = {
#      lookAndFeel = "org.kde.breezedark.desktop";
#    };
#
#    panels = [
#      location = "bottom";
#    ];
#  };
}
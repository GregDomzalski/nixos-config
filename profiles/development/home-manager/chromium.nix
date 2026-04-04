{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.development;

  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };

  # Detect if we're on a system with NVIDIA GPU
  isNvidia = config.hardware.gpu.vendor or null == "nvidia";

  # Base flags for all systems
  baseFlags = [
    "--class=browser"
    "--no-default-browser-check"
    "--no-first-run"
    "--enable-features=WaylandWindowDecorations"
    "--enable-gpu-rasterization"
    "--enable-zero-copy"
  ];

  # NVIDIA-specific flags for better Wayland+NVIDIA performance
  nvidiaFlags = [
    "--use-gl=desktop"
    "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder"
    "--disable-features=UseChromeOSDirectVideoDecoder"
  ];

  # Combine flags conditionally
  allFlags = baseFlags ++ (optionals isNvidia nvidiaFlags);
in {
  config = mkIf (cfg.enable && cfg.chromium.enable) {
    xdg = {
      dataFile."desktop-directories/critical-shift.directory".text = ''
        [Desktop Entry]
        Type=Directory
        Name=Critical Shift
        Icon=emblem-important
      '';
      configFile."menus/applications-merged/critical-shift.menu".text = ''
        <!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
        "http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd">
        <Menu>
          <Name>Applications</Name>
          <Menu>
            <Name>Critical Shift</Name>
            <Directory>critical-shift.directory</Directory>
            <Include>
              <Category>X-CriticalShift</Category>
            </Include>
          </Menu>
        </Menu>
      '';
    };

    programs.chromium = {
      enable = true;

      commandLineArgs = allFlags;

      extensions = [
        # uBlock Origin Lite
        { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }
        # 1Password
        { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; }
      ];

      apps = {
        "Gmail" = {
          url = "mail.google.com";
          icon = pkgs.gregos.logo-icons.gmail;
          categories = [ "X-CriticalShift" ];
        };

        "Google Chat" = {
          url = "chat.google.com";
          icon = pkgs.gregos.logo-icons.gchat;
          categories = [ "X-CriticalShift" ];
        };

        "Google Calendar" = {
          url = "calendar.google.com";
          icon = pkgs.gregos.logo-icons.gcal;
          categories = [ "X-CriticalShift" ];
        };

        "Google Meet" = {
          url = "meet.google.com";
          icon = pkgs.gregos.logo-icons.gmeet;
          categories = [ "X-CriticalShift" ];
        };

        "Notion" = {
          url = "notion.so";
          icon = pkgs.gregos.logo-icons.notion;
          categories = [ "X-CriticalShift" ];
        };
      };

      # ─── Policies ────────────────────────────────────────────────────────
      policies = {
        # ── GPU & Hardware Acceleration ─────────────────────────────────────
        HardwareAccelerationModeEnabled = true;
        Disable3DAPIs = false;

        # ── Passwords & autofill ────────────────────────────────────────────
        PasswordManagerEnabled = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        # ── Browser defaults ────────────────────────────────────────────────
        DefaultBrowserSettingEnabled = false;

        # ── Session restore ─────────────────────────────────────────────────
        # 1 = Restore the last session (always, including after a crash)
        RestoreOnStartup = 1;

        # ── Telemetry ───────────────────────────────────────────────────────
        MetricsReportingEnabled = false;
        SafeBrowsingSurveysEnabled = false;

        # ── Permissions: camera & microphone for Google Meet ────────────────
        VideoCaptureAllowedUrls = [ "https://meet.google.com" ];
        AudioCaptureAllowedUrls = [ "https://meet.google.com" ];

        # ── Auto-launch Zoom protocol links without a prompt ────────────────
        AutoLaunchProtocolsFromOrigins = [
          {
            protocol = "zoommtg";
            allowed_origins = [ "https://zoom.us" "https://*.zoom.us" ];
          }
          {
            protocol = "zoomus";
            allowed_origins = [ "https://zoom.us" "https://*.zoom.us" ];
          }
        ];

        # ── AI / Generative AI: disable all ─────────────────────────────────
        # 2 = Disabled
        HelpMeWriteSettings = 2;
        CreateThemesSettings = 2;

        # ── Kagi as default search engine ───────────────────────────────────
        DefaultSearchProviderEnabled = true;
        DefaultSearchProviderName = "Kagi";
        DefaultSearchProviderKeyword = "k";
        DefaultSearchProviderSearchURL = "https://kagi.com/search?q=%s";
        DefaultSearchProviderSuggestURL = "https://kagi.com/api/autosuggest?q=%s";
        DefaultSearchProviderNewTabURL = "https://kagi.com";

        # ── New tab & homepage ──────────────────────────────────────────────
        NewTabPageLocation = "https://kagi.com";
        HomepageIsNewTabPage = true;
        HomepageLocation = "https://kagi.com";
      };
    };
  };
}

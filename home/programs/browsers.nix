{ config, lib, pkgs, ... }:

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };

    icons = {
      gmail = ../../assets/icons/gmail.svg;
      gchat = ../../assets/icons/gchat.svg;
      gcal = ../../assets/icons/gcal.svg;
      gmeet = ../../assets/icons/gmeet.svg;
      notion = ../../assets/icons/notion.svg;
    };

    # Detect if we're on a system with NVIDIA GPU
    isNvidia = config.hardware.gpu.vendor or null == "nvidia";

    # Base flags for all systems
    baseFlags = [
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
    allFlags = baseFlags ++ (lib.optionals isNvidia nvidiaFlags);
  in
{
  # Set the default browser to Firefox
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };
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


  # ─────────────────────────────────────────────────────────────────────────
  # CHROMIUM
  # ─────────────────────────────────────────────────────────────────────────
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
        icon = "${icons.gmail}";
        categories = [ "X-CriticalShift" ];
      };

      "Google Chat" = {
        url = "chat.google.com";
        icon = "${icons.gchat}";
        categories = [ "X-CriticalShift" ];
      };

      "Google Calendar" = {
        url = "calendar.google.com";
        icon = "${icons.gcal}";
        categories = [ "X-CriticalShift" ];
      };

      "Google Meet" = {
        url = "meet.google.com";
        icon = "${icons.gmeet}";
        categories = [ "X-CriticalShift" ];
      };

      "Notion" = {
        url = "notion.so";
        icon = "${icons.notion}";
        categories = [ "X-CriticalShift" ];
      };
    };

    # ─── Policies ────────────────────────────────────────────────────────
    policies = {
      # ── GPU & Hardware Acceleration ─────────────────────────────────────
      HardwareAccelerationModeEnabled = true;
      Disable3DAPIs = false;

      # ── Passwords & autofill ────────────────────────────────────────────
      PasswordManagerEnabled    = false;
      AutofillAddressEnabled    = false;
      AutofillCreditCardEnabled = false;

      # ── Browser defaults ────────────────────────────────────────────────
      DefaultBrowserSettingEnabled = false;

      # ── Session restore ─────────────────────────────────────────────────
      # 1 = Restore the last session (always, including after a crash)
      RestoreOnStartup = 1;

      # ── Telemetry ───────────────────────────────────────────────────────
      MetricsReportingEnabled    = false;
      SafeBrowsingSurveysEnabled = false;

      # ── Permissions: camera & microphone for Google Meet ────────────────
      VideoCaptureAllowedUrls = [ "https://meet.google.com" ];
      AudioCaptureAllowedUrls = [ "https://meet.google.com" ];

      # ── Auto-launch Zoom protocol links without a prompt ────────────────
      # Covers both the zoommtg:// and zoomus:// URI schemes that Zoom uses.
      AutoLaunchProtocolsFromOrigins = [
        {
          protocol        = "zoommtg";
          allowed_origins = [ "https://zoom.us" "https://*.zoom.us" ];
        }
        {
          protocol        = "zoomus";
          allowed_origins = [ "https://zoom.us" "https://*.zoom.us" ];
        }
      ];

      # ── AI / Generative AI: disable all ─────────────────────────────────
      # These are Chrome-branded policies; open-source Chromium may ignore some.
      # 2 = Disabled
      HelpMeWriteSettings  = 2;
      CreateThemesSettings = 2;

      # ── Kagi as default search engine ───────────────────────────────────
      DefaultSearchProviderEnabled    = true;
      DefaultSearchProviderName       = "Kagi";
      DefaultSearchProviderKeyword    = "k";
      DefaultSearchProviderSearchURL  = "https://kagi.com/search?q=%s";
      DefaultSearchProviderSuggestURL = "https://kagi.com/api/autosuggest?q=%s";
      DefaultSearchProviderNewTabURL  = "https://kagi.com";

      # ── New tab & homepage ──────────────────────────────────────────────
      NewTabPageLocation   = "https://kagi.com";
      HomepageIsNewTabPage = true;
      HomepageLocation     = "https://kagi.com";
    };
  };


  # ─────────────────────────────────────────────────────────────────────────
  # FIREFOX
  # ─────────────────────────────────────────────────────────────────────────
  # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  # https://github.com/Misterio77/nix-config/blob/main/home/gabriel/features/desktop/common/firefox.nix
  programs.firefox = {
    enable = true;

    profiles.greg = {

      search = {
        force          = true;
        default        = "kagi";
        privateDefault = "kagi";
        engines = {
          kagi = {
            name = "Kagi";
            urls = [{ template = "https://kagi.com/search?q={searchTerms}"; }];
            icon = "https://kagi.com/favicon.ico";
          };
        };
      };

      settings = {
        # ── Session restore ────────────────────────────────────────────────
        # No policy equivalent; must be set at the profile level.
        # 0=blank  1=homepage  2=last-visited  3=restore-previous-session
        "browser.startup.page"                   = 3;
        "browser.sessionstore.enabled"           = true;
        "browser.sessionstore.resume_from_crash" = true;

        # ── First-run / onboarding ────────────────────────────────────────
        # Not covered by OverrideFirstRunPage or UserMessaging policies.
        "browser.bookmarks.addedImportButton"            = true;
        "browser.disableResetPrompt"                     = true;
        "browser.download.panel.shown"                   = true;
        "browser.feeds.showFirstRunUI"                   = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false; # not a UserMessaging key
        "browser.rights.3.shown"                         = true;
        "browser.uitour.enabled"                         = false;

        # ── New tab: feeds not mapped to a FirefoxHome policy key ──────────
        # FirefoxHome covers TopSites/Highlights/Pocket/Stories/Snippets/
        # Sponsored; these lower-level feed toggles have no policy equivalent.
        "browser.newtabpage.activity-stream.feeds.adsfeed"                     = false;
        "browser.newtabpage.activity-stream.feeds.discoverystreamfeed"         = false;
        "browser.newtabpage.activity-stream.feeds.inferredpersonalizationfeed" = false;
        "browser.newtabpage.activity-stream.feeds.places"                      = false;
        "browser.newtabpage.activity-stream.feeds.recommendationprovider"      = false;
        "browser.newtabpage.activity-stream.feeds.weatherfeed"                 = false;
        "browser.newtabpage.activity-stream.feeds.sections"                    = false;
        "browser.newtabpage.activity-stream.default.sites"                     = "";
        # DisableTelemetry only covers toolkit.telemetry.* and datareporting.*;
        # activity-stream telemetry is a separate subsystem.
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry"        = false;

        # ── Telemetry not covered by DisableTelemetry policy ──────────────
        "browser.discovery.enabled"            = false;
        "browser.ping-centre.telemetry"        = false;
        "datareporting.sessions.current.clean" = true;
        "devtools.onboarding.telemetry.logged" = false;

        # ── Privacy / hardening ───────────────────────────────────────────
        # No policy equivalents for these.
        "network.dns.echconfig.enabled"        = true;
        "network.dns.http3_echconfig.enabled"  = true;
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phising.enabled" = false;
        # EnableTrackingProtection sets protection on but does not
        # select the "strict" preset; that requires this pref.
        "browser.contentblocking.category" = "strict";

        # ── Search: not covered by SearchSuggestEnabled policy ─────────────
        "browser.search.serpEventTelemetryCategorization.enabled"       = false;
        "browser.search.serpEventTelemetryCategorization.regionEnabled" = false;
        "browser.urlbar.showSearchSuggestionsFirst"                     = false;

        # ── AI: base ML runtime toggle ─────────────────────────────────────
        # GenerativeAI policy disables the chat UI but does not set the
        # underlying browser.ml.enable pref.
        "browser.ml.enable" = false;
      };
    };

    policies = {
      # ── Updates ────────────────────────────────────────────────────────
      AppAutoUpdate       = false;
      ManualAppUpdateOnly = true;

      # ── Autofill ───────────────────────────────────────────────────────
      AutofillAddressEnabled    = false;
      AutofillCreditCardEnabled = false;

      # ── Zoom: auto-launch protocol links from zoom.us without prompting ─
      AutoLaunchProtocolsFromOrigins = [
        {
          protocol        = "zoommtg";
          allowed_origins = [ "https://zoom.us" ];
        }
        {
          protocol        = "zoomus";
          allowed_origins = [ "https://zoom.us" ];
        }
      ];

      CaptivePortal               = false;
      DisableFeedbackCommands     = true;
      DisableFirefoxScreenshots   = true;
      DisableFirefoxStudies       = true;
      DisableFormHistory          = true;
      DisablePocket               = true;
      DisableProfileImport        = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry            = true;
      DisplayBookmarksToolbar     = "never";
      DisplayMenuBar              = "default-off";
      DontCheckDefaultBrowser     = true;

      EnableTrackingProtection = {
        Value          = true;
        Locked         = true;
        Cryptomining   = true;
        Fingerprinting = false; # Breaks too many sites when enabled
        EmailTracking  = true;
      };

      # ── New tab: search bar only, everything else off ──────────────────
      FirefoxHome = {
        Search            = true;
        TopSites          = false;
        SponsoredTopSites = false;
        Highlights        = false;
        Pocket            = false;
        Stories           = false;
        SponsoredPocket   = false;
        SponsoredStories  = false;
        Snippets          = false;
        Locked            = true;
      };

      FirefoxSuggest = {
        WebSuggestions       = false;
        SponsoredSuggestions = false;
        ImproveSuggest       = false;
        Locked               = true;
      };

      GenerativeAI = {
        Enabled = false;
        Locked  = true;
      };

      HardwareAcceleration = true;
      HttpsOnlyMode        = "enabled";
      LegacyProfiles       = false;
      NoDefaultBookmarks   = true;
      OfferToSaveLogins        = false;
      OfferToSaveLoginsDefault = false;
      OverrideFirstRunPage     = "";
      OverridePostUpdatePage   = "";
      PasswordManagerEnabled   = false;

      # ── Permissions: allow camera + microphone on Google Meet ──────────
      Permissions = {
        Camera = {
          Allow  = [ "https://meet.google.com" ];
          Locked = false;
        };
        Microphone = {
          Allow  = [ "https://meet.google.com" ];
          Locked = false;
        };
      };

      SearchBar = "unified";

      SearchEngines = {
        Add = [
          {
            Name               = "Kagi";
            URLTemplate        = "https://kagi.com/search?q={searchTerms}";
            Method             = "GET";
            IconURL            = "https://kagi.com/favicon.ico";
            Alias              = "k";
            Description        = "Kagi Search";
            SuggestURLTemplate = "https://kagi.com/api/autosuggest?q={searchTerms}";
          }
        ];
        Default = "Kagi";
        Remove  = [
          "Google"
          "Amazon.com"
          "Bing"
          "eBay"
          "DuckDuckGo"
        ];
      };

      SearchSuggestEnabled = false;
      ShowHomeButton       = false;
      SkipTermsOfUse       = true; # Firefox 130+

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations   = false;
        UrlbarInterventions      = false;
        SkipOnboarding           = true;
        MoreFromMozilla          = false;
        FirefoxLabs              = false;
        Locked                   = true;
      };

      # ── Extensions ─────────────────────────────────────────────────────
      ExtensionSettings = {
        "*".installation_mode = "blocked";

        # uBlock Origin – overflow menu
        "uBlock0@raymondhill.net" = {
          install_url       = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing  = true;
          default_area      = "menupanel";
        };

        # 1Password – pinned to toolbar
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url       = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing  = true;
          default_area      = "navbar";
        };

        # SimpleLogin – pinned to toolbar
        "addon@simplelogin" = {
          install_url       = "https://addons.mozilla.org/firefox/downloads/latest/simplelogin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing  = true;
          default_area      = "navbar";
        };

        # SponsorBlock – overflow menu
        "sponsorBlocker@ajay.app" = {
          install_url       = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
          private_browsing  = true;
          default_area      = "menupanel";
        };
      };
    };
  };
}

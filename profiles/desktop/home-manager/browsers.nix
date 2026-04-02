{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.browsers.enable) {
    # Set the default browser to Firefox
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };

    # ─────────────────────────────────────────────────────────────────────────
    # FIREFOX
    # ─────────────────────────────────────────────────────────────────────────
    programs.firefox = {
      enable = true;

      profiles.greg = {

        search = {
          force = true;
          default = "kagi";
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
          # 0=blank  1=homepage  2=last-visited  3=restore-previous-session
          "browser.startup.page" = 3;
          "browser.sessionstore.enabled" = true;
          "browser.sessionstore.resume_from_crash" = true;

          # ── First-run / onboarding ────────────────────────────────────────
          "browser.bookmarks.addedImportButton" = true;
          "browser.disableResetPrompt" = true;
          "browser.download.panel.shown" = true;
          "browser.feeds.showFirstRunUI" = false;
          "browser.messaging-system.whatsNewPanel.enabled" = false;
          "browser.rights.3.shown" = true;
          "browser.uitour.enabled" = false;

          # ── New tab: feeds not mapped to a FirefoxHome policy key ──────────
          "browser.newtabpage.activity-stream.feeds.adsfeed" = false;
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
          "browser.newtabpage.activity-stream.feeds.inferredpersonalizationfeed" = false;
          "browser.newtabpage.activity-stream.feeds.places" = false;
          "browser.newtabpage.activity-stream.feeds.recommendationprovider" = false;
          "browser.newtabpage.activity-stream.feeds.weatherfeed" = false;
          "browser.newtabpage.activity-stream.feeds.sections" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;

          # ── Telemetry not covered by DisableTelemetry policy ──────────────
          "browser.discovery.enabled" = false;
          "browser.ping-centre.telemetry" = false;
          "datareporting.sessions.current.clean" = true;
          "devtools.onboarding.telemetry.logged" = false;

          # ── Privacy / hardening ───────────────────────────────────────────
          "network.dns.echconfig.enabled" = true;
          "network.dns.http3_echconfig.enabled" = true;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.phising.enabled" = false;
          "browser.contentblocking.category" = "strict";

          # ── Search: not covered by SearchSuggestEnabled policy ─────────────
          "browser.search.serpEventTelemetryCategorization.enabled" = false;
          "browser.search.serpEventTelemetryCategorization.regionEnabled" = false;
          "browser.urlbar.showSearchSuggestionsFirst" = false;

          # ── AI: base ML runtime toggle ─────────────────────────────────────
          "browser.ml.enable" = false;
        };
      };

      policies = {
        # ── Updates ────────────────────────────────────────────────────────
        AppAutoUpdate = false;
        ManualAppUpdateOnly = true;

        # ── Autofill ───────────────────────────────────────────────────────
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        # ── Zoom: auto-launch protocol links from zoom.us without prompting ─
        AutoLaunchProtocolsFromOrigins = [
          {
            protocol = "zoommtg";
            allowed_origins = [ "https://zoom.us" ];
          }
          {
            protocol = "zoomus";
            allowed_origins = [ "https://zoom.us" ];
          }
        ];

        CaptivePortal = false;
        DisableFeedbackCommands = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisablePocket = true;
        DisableProfileImport = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        DontCheckDefaultBrowser = true;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = false;
          EmailTracking = true;
        };

        # ── New tab: search bar only, everything else off ──────────────────
        FirefoxHome = {
          Search = true;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          Stories = false;
          SponsoredPocket = false;
          SponsoredStories = false;
          Snippets = false;
          Locked = true;
        };

        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };

        GenerativeAI = {
          Enabled = false;
          Locked = true;
        };

        HardwareAcceleration = true;
        HttpsOnlyMode = "enabled";
        LegacyProfiles = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        PasswordManagerEnabled = false;

        # ── Permissions: allow camera + microphone on Google Meet ──────────
        Permissions = {
          Camera = {
            Allow = [ "https://meet.google.com" ];
            Locked = false;
          };
          Microphone = {
            Allow = [ "https://meet.google.com" ];
            Locked = false;
          };
        };

        SearchBar = "unified";

        SearchEngines = {
          Add = [
            {
              Name = "Kagi";
              URLTemplate = "https://kagi.com/search?q={searchTerms}";
              Method = "GET";
              IconURL = "https://kagi.com/favicon.ico";
              Alias = "k";
              Description = "Kagi Search";
              SuggestURLTemplate = "https://kagi.com/api/autosuggest?q={searchTerms}";
            }
          ];
          Default = "Kagi";
          Remove = [
            "Google"
            "Amazon.com"
            "Bing"
            "eBay"
            "DuckDuckGo"
          ];
        };

        SearchSuggestEnabled = false;
        ShowHomeButton = false;
        SkipTermsOfUse = true;

        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          UrlbarInterventions = false;
          SkipOnboarding = true;
          MoreFromMozilla = false;
          FirefoxLabs = false;
          Locked = true;
        };

        # ── Extensions ─────────────────────────────────────────────────────
        ExtensionSettings = {
          "*".installation_mode = "blocked";

          # uBlock Origin – overflow menu
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "menupanel";
          };

          # 1Password – pinned to toolbar
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "navbar";
          };

          # SimpleLogin – pinned to toolbar
          "addon@simplelogin" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/simplelogin/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "navbar";
          };

          # SponsorBlock – overflow menu
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "menupanel";
          };
        };
      };
    };
  };
}

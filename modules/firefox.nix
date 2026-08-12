{ ... }:

let
  extension = id: {
    name = id;
    value = {
      installation_mode = "force_installed";
    };
  };
in
{
  programs.firefox = {
    enable = true;

    policies = {
      # Privacy
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;

      # Passwords
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      # Browser
      DontCheckDefaultBrowser = true;
      DisableProfileImport = true;

      # Search
      SearchEngines.Default = "DuckDuckGo";

      # Security
      HttpsOnlyMode = "enabled";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      # Keep cookies, but isolate third-party cookies
      Cookies.Behavior = "partition-foreign";

      # New tab
      FirefoxHome = {
        Search = true;
        TopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        SponsoredTopSites = false;
        Snippets = false;
      };

      # Mozilla recommendations/promotions
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        SkipOnboarding = true;
      };

      # Suggestions
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      # Autofill
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      # Uncomment if you don't use Firefox Sync.
      # DisableFirefoxAccounts = true;

      ExtensionSettings = builtins.listToAttrs [
        (extension "uBlock0@raymondhill.net")
        (extension "{446900e4-71c2-419a-a7a6-df9c091e268b}")
        (extension "addon@darkreader.org")
        (extension "sponsorBlocker@ajay.app")
        (extension "pywalfox@frewacom.org")
        (extension "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}")
      ];
    };

    # Preferences are outside `policies`.
    preferences = {
      "browser.urlbar.suggest.quicksuggest" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.quicksuggest.dataCollection.enabled" = false;
      "browser.search.suggest.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

      # Optional: stronger anti-fingerprinting, but can break websites.
      # "privacy.resistFingerprinting" = true;
    };
  };
}

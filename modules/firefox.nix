{ ... }:

let
  extension = shortId: id: {
    name = id;
    value = {
      install_url =
        "https://addons.mozilla.org/firefox/downloads/latest/${shortId}/latest.xpi";
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
      SearchEngines = {
        Default = "DuckDuckGo";
      };

      # Security
      HTTPSOnlyMode = "enabled";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

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

      # Mozilla promotions
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        SkipOnboarding = true;
      };

      # Firefox Suggestions
      FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
      };

      # Autofill
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      # Preferences
      programs.firefox.preferences = {
      "browser.urlbar.suggest.quicksuggest" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.quicksuggest.dataCollection.enabled" = false;
    
      "browser.search.suggest.enabled" = false;
    
      "browser.discovery.enabled" = false;
    
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      };

          # Extensions
      ExtensionSettings = builtins.listToAttrs [
        (extension "ublock-origin"
          "uBlock0@raymondhill.net")

        (extension "bitwarden-password-manager"
          "{446900e4-71c2-419f-a6a7-df9c091e268b}")

        (extension "darkreader"
          "addon@darkreader.org")

        (extension "sponsorblock"
          "sponsorBlocker@ajay.app")

        (extension "pywalfox"
          "pywalfox@frewacom.org")
      ];
    };
  };
}

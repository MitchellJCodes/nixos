{ zen-browser, pkgs, ... }:

let
  extension = addonId: {
    installation_mode = "force_installed";
    install_url =
      "https://addons.mozilla.org/firefox/downloads/latest/${addonId}/latest.xpi";
  };

  extensions = {
    "uBlock0@raymondhill.net" =
      extension "ublock-origin";

    "{446900e4-71c2-419f-a6a7-df9c091e268b}" =
      extension "bitwarden-password-manager";

    "addon@darkreader.org" =
      extension "darkreader";

    "sponsorBlocker@ajay.app" =
      extension "sponsorblock";

    "pywalfox@frewacom.org" =
      extension "pywalfox";

    "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}" =
      extension "hide-youtube-shorts";
  };
in
{
  environment.systemPackages = [
    (zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight.override {
      extraPolicies = {
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;

        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;

        DontCheckDefaultBrowser = true;
        DisableProfileImport = true;

        HttpsOnlyMode = "enabled";

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };

        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          MoreFromMozilla = false;
          FirefoxLabs = false;
          SkipOnboarding = true;
        };

        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
        };

        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        Cookies = {
          Behavior = "partition-foreign";
        };

        ExtensionSettings = extensions;

        SearchEngines = {
          Default = "DuckDuckGo";

          Add = [
            {
              Name = "nixpkgs packages";
              URLTemplate =
                "https://search.nixos.org/packages?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@np";
            }

            {
              Name = "NixOS options";
              URLTemplate =
                "https://search.nixos.org/options?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@no";
            }

            {
              Name = "NixOS Wiki";
              URLTemplate =
                "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@nw";
            }

            {
              Name = "noogle";
              URLTemplate =
                "https://noogle.dev/q?term={searchTerms}";
              IconURL = "https://noogle.dev/favicon.ico";
              Alias = "@ng";
            }
          ];
        };
      };
    })
  ];
}

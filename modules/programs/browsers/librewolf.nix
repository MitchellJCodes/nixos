{ pkgs, ... }:

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
    package = pkgs.librewolf;

    policies = {

      # Extensions
      ExtensionSettings = builtins.listToAttrs [
        # uBlock Origin
        (extension "uBlock0@raymondhill.net")

        # Bitwarden
        (extension "{446900e4-71c2-419f-a6a7-df9c091e268b}")

        # Dark Reader
        (extension "addon@darkreader.org")

        # SponsorBlock
        (extension "sponsorBlocker@ajay.app")

        # Pywalfox
        (extension "pywalfox@frewacom.org")

        # Hide YouTube Shorts
        (extension "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}")

        # ...
      ];

      # Search engines / URL aliases
      SearchEngines = {
        Default = "DuckDuckGo";

        Add = [
          {
            Name = "nixpkgs packages";
            URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@np";
          }

          {
            Name = "NixOS options";
            URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@no";
          }

          {
            Name = "NixOS Wiki";
            URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@nw";
          }

          {
            Name = "noogle";
            URLTemplate = "https://noogle.dev/q?term={searchTerms}";
            IconURL = "https://noogle.dev/favicon.ico";
            Alias = "@ng";
          }
        ];
      };

    Preferences = {
      "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
      "cookiebanners.service.mode" = 2; # Block cookie banners
      "privacy.donottrackheader.enabled" = true;
      "privacy.fingerprintingProtection" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.trackingprotection.emailtracking.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.fingerprinting.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      };
    };
  };

  environment.etc."firefox/policies/policies.json".target =
    "librewolf/policies/policies.json";
}

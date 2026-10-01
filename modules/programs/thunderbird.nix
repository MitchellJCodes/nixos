{ ... }:

let
  extension = shortId: id: {
    name = id;
    value = {
      install_url =
        "https://addons.thunderbird.net/thunderbird/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "force_installed";
    };
  };
in
{
  programs.thunderbird = {
    enable = true;

    policies = {
      DisableTelemetry = true;

      ExtensionSettings = builtins.listToAttrs [
        (extension "ublock-origin"
          "uBlock0@raymondhill.net")

        (extension "darkreader"
          "addon@darkreader.org")

        (extension "pywalfox"
          "pywalfox@frewacom.org")
      ];
    };
  };
}

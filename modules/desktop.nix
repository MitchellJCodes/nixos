{ pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager = {
    sddm = {
      enable = true;

      wayland.enable = true;

      theme = "sddm-astronaut-theme";

      extraPackages = [
        pkgs.sddm-astronaut
      ];
    };

    autoLogin = {
      enable = true;
      user = "mitch";
    };
  };

  programs.niri.enable = true;

  services.gvfs.enable = true;

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];
}

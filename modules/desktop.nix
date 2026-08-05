{ pkgs, username, ... }:

let
  sddm-astronaut-custom = pkgs.sddm-astronaut.override {
    themeConfig = {
      Background = "Backgrounds/sddm-bg.jpg";
    };
  };
in
{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = [
    sddm-astronaut-custom
  ];

  services.displayManager = {
    sddm = {
      enable = true;

      wayland.enable = true;

      theme = "sddm-astronaut-theme";

      extraPackages = [
        sddm-astronaut-custom
      ];

      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = 24;
        };
      };
    };

    autoLogin = {
      enable = true;
      user = username;
    };
  };

  programs.niri.enable = true;

  services.gvfs.enable = true;

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      sddm-astronaut = prev.sddm-astronaut.overrideAttrs (old: {
        postInstall = ''
          chmod -R u+w $out/share/sddm/themes/sddm-astronaut-theme

          mkdir -p $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds

          cp ${./assets/sddm-bg.jpg} \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/sddm-bg.jpg
        '';
      });

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

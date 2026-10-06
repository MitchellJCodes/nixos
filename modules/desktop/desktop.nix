{ pkgs, ... }:

{
  # Desktop / shell
  programs.umbriel.enable = true;

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    recommendedServices.enable = true;
  };

  systemd.user.services.noctalia = {
    environment = {
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };

  # X11 keyboard configuration
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Desktop integration
  services.gvfs.enable = true;
  programs.dconf.enable = true;

  # GNOME services used by desktop applications
  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    login.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
  };

  # Desktop authentication / connectivity
  security.polkit.enable = true;
  programs.kdeconnect.enable = true;

  # Hardware / power
  hardware.bluetooth.enable = true;
  hardware.i2c.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # XDG portals
  xdg.portal = {
    enable = true;

    # extraPortals = with pkgs; [
    #   xdg-desktop-portal-wlr
    #   xdg-desktop-portal-gnome
    #   xdg-desktop-portal-gtk
    # ];
  };
}

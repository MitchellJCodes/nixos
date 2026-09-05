{ pkgs, ... }:

{
  # Desktop / session
  programs.niri.enable = true;

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
  services.gnome.tinysparql.enable = true;
  services.gnome.localsearch.enable = true;

  security.pam.services = {
    login.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
  };

  # Desktop authentication / connectivity
  security.polkit.enable = true;
  programs.kdeconnect.enable = true;

  # Hardware / power
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # XDG portals
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}

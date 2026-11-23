{ pkgs, ... }:

{

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Desktop / shell
  programs.umbriel.enable = true;

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    recommendedServices.enable = true;
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

  # Environment variables
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    GTK_THEME = "adw-gtk3-dark";
  };

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
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Automatically switch power profiles based on AC/battery state
  services.udev.extraRules = ''
    # AC connected: balanced
    ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced"

    # AC disconnected: power saver
    ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ENV{POWER_SUPPLY_ONLINE}=="0", RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver"
  '';

  # XDG portals
  xdg.portal = {
    enable = true;
  };
}

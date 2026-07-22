{ pkgs, ... }:

{
  # Printing
  services.printing = {
  enable = true;
  webInterface = true;
  };
  
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
  description = "Add Flathub Flatpak repository";

  after = [ "network-online.target" ];
  wants = [ "network-online.target" ];
  wantedBy = [ "multi-user.target" ];

  path = [ pkgs.flatpak ];

  script = ''
    flatpak remote-add --if-not-exists \
      flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  '';

  serviceConfig.Type = "oneshot";
  };

  # Appimage support
  programs.appimage = {
  enable = true;
  binfmt = true;
  };

  # KDE Connect
  programs.kdeconnect.enable = true;

  # Polkit
  security.polkit.enable = true;

  # Dconf (Gnome)
  programs.dconf.enable = true;

  # GNOME Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  
  # Allow Unfree Repository
  nixpkgs.config.allowUnfree = true;

  # Auto Optimise store
  nix.settings.auto-optimise-store = true;
  
  # 7 Day Garbage collection
  nix.gc.automatic = true;

  # Enable Flakes and Nix commands
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Timezone and Locale
  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}

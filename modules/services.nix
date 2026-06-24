{ ... }:

{
  # Flatpak
  services.flatpak.enable = true;

  # Appimage support
  programs.appimage = {
  enable = true;
  binfmt = true;
  };

  # ROG Control Center
  programs.rog-control-center.enable = true;
  #programs.rog-control-center.autoStart = true;  

  # KDE Connect
  programs.kdeconnect.enable = true;

  # Polkit
  security.polkit.enable = true;

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

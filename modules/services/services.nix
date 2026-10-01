{ pkgs, ... }:

{
  # Disable hibernation, but keep regular suspend/sleep
  systemd.sleep.settings.Sleep = {
    AllowSuspend = true;
    AllowHibernation = false;
    AllowHybridSleep = false;
    AllowSuspendThenHibernate = false;
  };

  # Printing
  services.printing = {
    enable = true;
    webInterface = true;
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

  # Force-install required Flatpaks
  systemd.services.flatpak-install = {
    description = "Install required Flatpak applications";

    after = [ "flatpak-repo.service" ];
    requires = [ "flatpak-repo.service" ];
    wantedBy = [ "multi-user.target" ];

    path = [ pkgs.flatpak ];

    script = ''
      flatpak install --system --noninteractive flathub \
        com.github.tchx84.Flatseal \
        com.dec05eba.gpu_screen_recorder
    '';

    serviceConfig.Type = "oneshot";
  };

  # AppImage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

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

{
  config,
  pkgs,
  pkgs-stable,
  ...
}:

{
  # General Packages
  environment.systemPackages =
    (with pkgs; [
      # Desktop
      gnome-session

      # CLI
      wl-clipboard
      eza
      btop
      yazi
      file
      fastfetch
      pywalfox-native
      git
      helix
      ripgrep
      ffmpeg
      _7zz
      jq
      poppler
      fd
      fzf
      resvg
      imagemagick
      xdg-user-dirs
      glib
      bat
      tldr
      ddcutil
      prettier
      nixfmt

      # Terminal
      foot

      # Files
      nautilus

      # Theme
      bibata-cursors
      papirus-icon-theme
      adw-gtk3
      nwg-look
      kdePackages.qt6ct

      # Shell
      starship
      zoxide
      atuin
      zellij

      # Applications
      bazaar
      mpv
      snapshot
      rhythmbox
      imv
      gparted
      audacity
      signal-desktop
      mousam
      file-roller
      localsend
      gnome-calculator
      system-config-printer
      gnome-text-editor
      komikku

      # Office
      kdePackages.okular
      libreoffice
      hunspell
      hunspellDicts.en_US
      hyphenDicts.en_US
    ])
    ++ (with pkgs-stable; [
      # Stable packages (nixos-26.05)
      gearlever
      libguestfs
      guestfs-tools
      #...
    ]);

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazygit.enable = true;

  # Nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };

  # OBS-Studio
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # GSR-UI
  programs.gpu-screen-recorder = {
    enable = true;
    ui.enable = true; # For overlay
  };
}

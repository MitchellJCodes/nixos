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
      nixfmt-tree
      sl

      # Terminal
      foot
      # ghostty

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
      qalculate-gtk
      imv
      gparted
      audacity
      signal-desktop
      mousam
      xarchiver
      localsend
      system-config-printer
      komikku
      gearlever
      comaps

      # Office
      kdePackages.okular
      libreoffice
      hunspell
      hunspellDicts.en_US
      hyphenDicts.en_US
    ])
    ++ (with pkgs-stable; [
      # Stable packages (nixos-26.05)
      #...
    ]);

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.evolution.enable = true;

  programs.lazygit.enable = true;

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

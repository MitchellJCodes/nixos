{ config, pkgs, pkgs-stable, ... }:

{
  # General Packages
  environment.systemPackages = (with pkgs; [
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
    rar
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
    cowsay
    fortune
    lolcat

    # Terminal
    foot

    # Files
    nautilus
    
    # Theme
    bibata-cursors
    papirus-icon-theme
    adw-gtk3
    kdePackages.qt6ct
    nwg-look

    # Shell
    starship
    zoxide
    atuin
    zellij

    # Applications (unstable)
    bazaar
    mpv
    snapshot
    rhythmbox
    imv
    gnome-disk-utility
    audacity
    signal-desktop
    mousam
    xarchiver
    file-roller
    localsend
    xwayland-satellite
    gnome-calculator
    system-config-printer

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
  ]);

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

  nixpkgs.config = {
    problems.handlers."gtk+".broken = "warn"; # or "ignore"
  };
}

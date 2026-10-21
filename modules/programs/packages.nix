{ pkgs, ... }:

{
  # General Packages
  environment.systemPackages = with pkgs; [
    # Desktop
    gnome-session
    sddm-astronaut

    # CLI
    sbctl
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
    p7zip
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
    distrobox

    # Terminal
    foot

    # Files
    nautilus
    xarchiver
    sushi

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
        
    # Utilities
    localsend
    xwayland-satellite
    gnome-calculator
    system-config-printer
    gearlever
      
    # Applications
    bazaar
    showtime
    snapshot
    rhythmbox
    gnome-text-editor
    loupe
    gnome-disk-utility
    # audacity
    signal-desktop
    mousam
        
    # Office
    kdePackages.okular
    libreoffice
    hunspell
    hunspellDicts.en_US
    hyphenDicts.en_US
  ];

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

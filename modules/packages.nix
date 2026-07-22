{ pkgs, noctalia, ... }:

{
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
            
    # Terminal
    ghostty

    # Files
    nautilus
    file-roller
    sushi

    # Theme / Fonts
    glib
    inter
    nerd-fonts.jetbrains-mono
    bibata-cursors
    adwaita-icon-theme
    adwaita-fonts

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji

    liberation_ttf
    corefonts

    # Shell
    starship
    xdg-user-dirs
    zoxide
    
    # Noctalia
    noctalia.packages.${pkgs.system}.default

    # Utilities
    localsend
    xwayland-satellite
    gnome-calculator
    system-config-printer
  
    # GNOME Apps
    bazaar
    showtime
    snapshot
    gnome-music
    gnome-text-editor
    loupe
    tinysparql
    localsearch
    gnome-disk-utility

    # Gaming
    wineWow64Packages.stable
    winetricks
    protonplus
    lutris-free
    goverlay
    mangohud
    gamescope
    gamemode

    # Office
    kdePackages.okular
    onlyoffice-desktopeditors

    # Audio
    audacity

    # Communication
    signal-desktop
    
    # Browser Integration
    pywalfox-native

    # Fish Plugins
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc

    fzf
    grc
  ];
}

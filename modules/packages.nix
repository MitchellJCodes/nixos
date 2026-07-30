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

    # Theme
    bibata-cursors
    adwaita-icon-theme
    papirus-icon-theme

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

    # Office
    kdePackages.okular
    libreoffice-fresh

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

    grc
  ];
}

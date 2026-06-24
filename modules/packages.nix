{ pkgs, noctalia, ... }:

{
  environment.systemPackages = with pkgs; [
    # Desktop
    gnome-session
    sddm-astronaut

    # CLI
    eza
    btop
    yazi
    fastfetch
    git
    helix
    
    # Browsers
    firefox

    # Terminal
    ghostty

    # Files
    nautilus
    sushi

    # Theme / Fonts
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
    zoxide
    xdg-user-dirs

    # Noctalia
    noctalia.packages.${pkgs.system}.default

    # Utilities
    localsend
    xwayland-satellite
    gparted

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
    gamescope
    gamemode

    # Audio
    audacity

    # Communication
    signal-desktop
    vesktop

    # System
    snapper

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

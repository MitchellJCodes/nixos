{ pkgs, noctalia, ... }:

{
  # Firefox
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop
    gnome-session
    sddm-astronaut

    # CLI
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
    xdg-user-dirs
    zoxide
    
    # Noctalia
    noctalia.packages.${pkgs.system}.default

    # Utilities
    localsend
    xwayland-satellite
    gnome-calculator
  
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

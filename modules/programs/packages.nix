{ pkgs, app-manager, ... }:

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
    
    # Terminal
    foot

    # Files
    nautilus
    xarchiver
    sushi

    # Theme
    bibata-cursors
    papirus-icon-theme
    kdePackages.oxygen-icons
    adw-gtk3
    kdePackages.qt6ct
    nwg-look

    # Shell
    starship
    zoxide
    atuin
    zellij
    
    # Noctalia
    # seatd
    # elogind
    
    # AppManager
    app-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
        
    # Utilities
    localsend
    xwayland-satellite
    gnome-calculator
    system-config-printer
    # nwg-displays
      
    # Applications
    bazaar
    showtime
    snapshot
    rhythmbox
    gnome-text-editor
    loupe
    gnome-disk-utility
    audacity
    signal-desktop
    mousam

    # Office
    kdePackages.okular
    libreoffice
    hunspell
    hunspellDicts.en_US
    hyphenDicts.en_US
    
    # Fish Plugins
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc

    grc
  ];
}

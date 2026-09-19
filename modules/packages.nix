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
    nwg-look

    # Shell
    starship
    zoxide
    atuin
    zellij
    
    # Noctalia
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    seatd
    elogind

    # Utilities
    localsend
    xwayland-satellite
    gnome-calculator
    system-config-printer
    nwg-displays
      
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
    onlyoffice-desktopeditors
    
    # Fish Plugins
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc

    grc
  ];
}

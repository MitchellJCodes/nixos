{ pkgs, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Enable Gamescope
  programs.gamescope = {
    enable = true;
    enableWsi = true;
    capSysNice = false;
  };

  # Enable Steam
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Gaming packages
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stable
    winetricks
    protontricks
    protonplus
    lutris
    goverlay
    mangohud
    pcsx2
    # ...
  ];
}

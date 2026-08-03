{ pkgs, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Enable Steam
  programs.steam = {
    enable = true;

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
    lutris-free
    goverlay
    mangohud
    gamescope
  ];
}

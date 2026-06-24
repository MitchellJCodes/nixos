{ ... }:

{

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Enable Steam
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;

    dedicatedServer.openFirewall = true;

    localNetworkGameTransfers.openFirewall = true;
  };
}

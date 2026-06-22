{ config, pkgs, noctalia, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/gaming.nix
    ./modules/packages.nix
    ./modules/services.nix
    #./modules/nvidia.nix
  ];

  system.stateVersion = "26.05";
}

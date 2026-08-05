{ config, pkgs, noctalia, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    #./modules/secureboot.nix
    ./modules/swap.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/firefox.nix
    ./modules/thunderbird.nix
    ./modules/desktop.nix
    ./modules/dotfiles.nix
    ./modules/fonts.nix
    ./modules/audio.nix
    ./modules/gaming.nix
    ./modules/packages.nix
    ./modules/services.nix

    #./modules/nvidia.nix
    #./modules/rog.nix
    #./modules/virt-manager.nix

    #./modules/howdy.nix
  ];

  system.stateVersion = "26.05";
}

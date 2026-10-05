{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system/audio.nix
    ./modules/system/boot.nix
    ./modules/system/greeter.nix
    ./modules/system/networking.nix
    ./modules/system/swap.nix
    ./modules/system/users.nix


    # ./modules/hardware/nvidia.nix
    # ./modules/hardware/rog.nix


    ./modules/desktop/defaults.nix
    ./modules/desktop/desktop.nix
    ./modules/desktop/fonts.nix


    ./modules/dotfiles/dotfiles.nix


    # ./modules/programs/browsers/firefox.nix
    ./modules/programs/browsers/librewolf.nix


    ./modules/programs/gaming.nix
    ./modules/programs/packages.nix
    ./modules/programs/thunderbird.nix
    # ./modules/programs/virt-manager.nix

    # ./modules/services/howdy.nix
    ./modules/services/services.nix

  ];

  system.stateVersion = "26.05";
}

{ config, pkgs, ... }:

{
  imports = [
    # Shared modules
    ../../modules/system/audio.nix
    ../../modules/system/greeter.nix
    ../../modules/system/swap.nix
    ../../modules/system/users.nix
    # ../../modules/system/users-fish.nix

    # ../../modules/hardware/nvidia.nix
    ../../modules/hardware/nvidia-laptop.nix
    # ../../modules/hardware/rog.nix
    ../../modules/hardware/cardwired.nix

    ../../modules/desktop/defaults.nix
    ../../modules/desktop/desktop.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/lucoile.nix

    # ../../modules/programs/browsers/firefox.nix
    ../../modules/programs/browsers/librewolf.nix

    ../../modules/programs/gaming.nix
    ../../modules/programs/packages.nix
    ../../modules/programs/thunderbird.nix
    ../../modules/programs/virt-manager.nix

    ../../modules/services/howdy.nix
    ../../modules/services/services.nix

    ../../modules/dotfiles/dotfiles.nix

    # Host specific
    ./modules/system/networking.nix
    ./modules/system/boot.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "26.05";
}


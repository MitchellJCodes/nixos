{ config, pkgs, ... }:

{
  # Nvidia Settings
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = true; # false if legacy

    # Latest 16XX/20XX or newer
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    # Legacy 10XX-9XX or older
    # package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # CUDA binary cache
  nix.settings = {
    substituters = [
      "https://cache.nixos-cuda.org"
    ];

    trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

  # OBS support
  programs.obs-studio.package = pkgs.obs-studio.override {
    cudaSupport = true;
  };
}

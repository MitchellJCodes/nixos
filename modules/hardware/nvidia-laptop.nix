{ config, pkgs, ... }:

{
  # Nvidia Settings
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    nvidiaSettings = true;
    open = true;

    # Driver package
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # CUDA binary cache
  nix.settings = {
    substituters = [
      "https://cache.nixos-cuda.org"
    ];

    trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

  # Hybrid AMD + NVIDIA setup
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    amdgpuBusId = "PCI:101:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # OBS support
  programs.obs-studio.package = pkgs.obs-studio.override {
    cudaSupport = true;
  };

  # Enable NVIDIA S0ix power management
  boot.extraModprobeConfig = ''
    options nvidia NVreg_EnableS0ixPowerManagement=1
  '';
}

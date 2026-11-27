{ pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "spinner";
    };

    consoleLogLevel = 3;

    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi.canTouchEfiVariables = true;

      timeout = 0;

      systemd-boot.enable = true;
      };
    };
  };
}

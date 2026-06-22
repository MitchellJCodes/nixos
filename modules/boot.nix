{ pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "spinner";

      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 3;

    initrd = {
      verbose = false;

      # Add any LUKS device below
      luks.devices."luks-########-####-####-####-############".device =
       "/dev/disk/by-uuid/########-####-####-####-############";
    };

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      timeout = 0;

      systemd-boot.enable = true;

      efi.canTouchEfiVariables = true;
    };
  };
}

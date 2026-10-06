{ pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "spinner";
    };

    consoleLogLevel = 3;

    initrd = {
      verbose = false;
    };

    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      # timeout = 0.25;
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        secureBoot.enable = true;
        maxGenerations = 10;

        extraConfig = ''
          quiet: yes
          terse: yes
          timeout: 0.25
        '';
        
        style = {
          wallpapers = [ ./assets/boot_img2.png ];
          wallpaperStyle = "centered";
          # backdrop = "000000";

          interface = {
            branding = "";
            brandingColor = "FFFFFF";
            helpHidden = true;
            helpColor = "FFFFFF";
            helpColorBright = "FFFFFF";
          };
        };
      };
    };
  };
}

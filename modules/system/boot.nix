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
          wallpapers = [ ./assets/boot_img.jpg ];
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

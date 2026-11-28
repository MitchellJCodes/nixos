{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        serif = [
          "Noto Serif"
        ];

        sansSerif = [
          "Adwaita Sans"
          "Noto Sans"
        ];

        monospace = [
          "AdwaitaMono Nerd Font"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };

    packages = with pkgs; [
      # UI
      adwaita-fonts

      # Programming
      nerd-fonts.adwaita-mono

      # General text
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # Compatibility
      liberation_ttf
      corefonts
    ];
  };
}

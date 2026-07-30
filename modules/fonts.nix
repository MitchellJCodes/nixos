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
          "Inter"
          "Noto Sans"
        ];

        monospace = [
          "JetBrains Mono"
          "JetBrainsMono Nerd Font"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };

    packages = with pkgs; [
      # UI
      inter
      adwaita-fonts

      # Programming
      nerd-fonts.jetbrains-mono

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

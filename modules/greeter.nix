{ pkgs, username, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;

    greeter-args = "";

    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };

      keyboard = {
        layout = "us";
      };

      auth = {
        allow_empty_password = true;
      };

      appearance = {
        hide_logo = true;
        password_style = "random";
      };
    };
  };

  services.greetd.settings.initial_session = {
    command = "niri-session";
    user = username;
  };
}

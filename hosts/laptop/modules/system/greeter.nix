{ pkgs, username, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;

    passwordlessSyncUsers = [ username ];

    extraArgs = [ ];

    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
        idle.timeout = 60;
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
    command = "start-umbriel";
    user = username;
  };
}

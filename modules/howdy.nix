{ ... }:

{
  services.linux-enable-ir-emitter.enable = true;

  services.howdy = {
    enable = true;
    control = "sufficient";

    settings = {
      video = {
        device_path = "/dev/video2";
      };
    };
  };

  security.pam.services.greetd.howdy.enable = true;
}

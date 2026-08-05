{ ... }:

{
  services.linux-enable-ir-emitter.enable = true;

  services.howdy = {
    enable = true;
    control = "sufficient";

      video = {
        device_path = "/dev/video2";
      };
    };
  };
}

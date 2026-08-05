{ ... }:

{
  services.linux-enable-ir-emitter.enable = true;

  services.howdy = {
    enable = true;
    control = "sufficient";

    settings = {
      core = {
        # timeout = 5;
        # tolerance = 5;
      };

      video = {
        device_path = "/dev/video2";
      };
    };
  };
}

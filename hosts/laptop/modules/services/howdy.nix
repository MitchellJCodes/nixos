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

  security.pam.services = {
    greetd.howdy.enable = true;
    polkit-1.howdy.enable = true;
  };

  systemd.services."polkit-agent-helper@".serviceConfig = {
    PrivateDevices = false;
    DeviceAllow = "char-video4linux rw";
  };
}

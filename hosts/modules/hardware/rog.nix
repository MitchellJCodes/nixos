{ pkgs, ... }:

{
  services.asusd.enable = true;
  programs.rog-control-center.enable = true;

  systemd.services.asus-shutdown.path = [
    pkgs.kmod
  ];
}

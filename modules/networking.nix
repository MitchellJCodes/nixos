{ ... }:

{
  networking = {
    hostName = "nixos-btw";

    networkmanager.enable = true;

    firewall = {
      enable = true;

      # 53317 Open for Localsend
      allowedTCPPorts = [
        53317
      ];

      allowedUDPPorts = [
        53317
      ];
    };
  };
}

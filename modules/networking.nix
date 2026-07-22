{ ... }:

{
  networking = {
    hostName = "nixos-btw";

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    firewall = {
      enable = true;

      # LocalSend
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = [
        "9.9.9.9"
        "149.112.112.112"
        "2620:fe::fe"
        "2620:fe::9"
      ];

      FallbackDNS = [
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];

      DNSOverTLS = "true";
      DNSSEC = "allow-downgrade";

      # Use these resolvers for all domains.
      Domains = [ "~." ];
    };
  };
}

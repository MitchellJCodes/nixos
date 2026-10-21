{ hostname, ... }:

{
  networking = {
    hostName = hostname;

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

  # Disable NetworkManager wait-online at boot
  systemd.services.NetworkManager-wait-online.enable = false;

  # Network service discovery / mDNS
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # DNS
  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = [
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111#one.one.one.one"
        "2606:4700:4700::1001#one.one.one.one"
      ];

      DNSOverTLS = "true";
      DNSSEC = "allow-downgrade";
      Domains = [ "~." ];
    };
  };
}

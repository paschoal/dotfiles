{ config, lib, pkgs, ... }:

{
  services = {
    unbound = {
      enable = true;
      settings = {
        server = {
          verbosity = "0";
          interface = [ "127.0.0.1" ];
          port = "5335";
          access-control = [ "127.0.0.1 allow" ];
          do-ip4 = "yes";
          do-udp = "yes";
          do-tcp = "yes";
          do-ip6 = "yes";
          prefer-ip6 = "no";
          harden-glue = "yes";
          harden-dnssec-stripped = "yes";
          use-caps-for-id = "no";
          edns-buffer-size = 1232;
          prefetch = "yes";
          num-threads = 1;
          so-rcvbuf = "1m";
          private-address = [
            "192.168.0.0/16"
            "169.254.0.0/16"
            "172.16.0.0/12"
            "10.0.0.0/8"
            "fd00::/8"
            "fe80::/10"

            #
            # RFC 6303 4.2
            #
            "192.0.2.0/24"
            "198.51.100.0/24"
            "203.0.113.0/24"
            "255.255.255.255/32"
            "2001:db8::/32"
          ];
        };
        forward-zone = [
          { name = "."; forward-addr = "9.9.9.9#dns.quad9.net"; forward-tls-upstream = true; }
        ];
      };
    };

    pihole-ftl = {
      enable = true;
      settings = {
        dns = {
          upstreams = [
            "127.0.0.1#5335"
          ];
        };
      };
    };

    pihole-web = {
      enable = true;
      ports = [ "80" ];
    };
  };
}

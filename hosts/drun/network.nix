{ lib, ... }:
{
  systemd.network = {
    enable = true;
    netdevs = {
      "20-br0" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br0";
        };
        bridgeConfig.STP = true;
      };
    };

    networks."30-ethernet" = {
      matchConfig.Name = "enp2s0f0";
      networkConfig.Bridge = "br0";
      linkConfig.RequiredForOnline = "enslaved";
    };

    networks."40-br0" = {
      matchConfig.Name = "br0";
      address = [
        "192.168.2.10/24"
        "192.168.2.11/24"
      ];
      routes = [
        { Gateway = "192.168.2.1"; }
      ];
      dns = [ "192.168.2.1" ];
      linkConfig.RequiredForOnline = "routable";
    };
  };

  networking = {
    hostName = "drun";
    hosts = {
    };
    useDHCP = lib.mkDefault false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22    # ssh
        53    # dns
        80    # http
        443   # http-tls
        5432  # postgres
      ];
      allowedUDPPorts = [
        53    # dns
        67    # dhcp
        443   # http-tls
      ];
    };
  };
}

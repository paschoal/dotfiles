{ config, lib, pkgs, ... }:
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
      networkConfig = {
        DNS = [ "1.1.1.1" ];
        Gateway = "192.168.2.1";
        DHCP = "ipv4";
      };
      linkConfig.RequiredForOnline = "routable";
      dhcpV4Config.UseDNS = false;
    };
  };

  networking = {
    hostName = "gram";
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

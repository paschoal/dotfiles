{ lib, ... }:

{
  systemd.network = {
    enable = true;
    networks."10-ethernet" = {
      matchConfig.Name = "enp42s0";
      networkConfig = {
        DNS = [ "192.168.2.10" ];
        Gateway = "192.168.2.1";
        DHCP = "ipv4";
      };
      linkConfig.RequiredForOnline = "routable";
      dhcpV4Config.UseDNS = false;
    };
  };

  networking = {
    hostName = "mjolnir";
    useDHCP = lib.mkDefault false;
    firewall.enable = true;
  };
}

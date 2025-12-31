{ lib, ... }:

{
  systemd.network = {
    enable = true;
    networks."10-ethernet" = {
      matchConfig.Name = "enp42s0";
      networkConfig = {
        DHCP = "ipv4";
      };
      linkConfig.RequiredForOnline = "routable";
    };
  };

  networking = {
    hostName = "bree";
    useDHCP = lib.mkDefault false;
    firewall.enable = true;
  };
}

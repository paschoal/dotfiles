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
    firewall = {
      enable = true;
      allowedTCPPorts = [ 27036 27037 ];
      allowedUDPPorts = [ 27031 27036 ];
    };
  };
}

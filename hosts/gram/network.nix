{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "gram";
    domain = "gram.local";

    useDHCP = lib.mkDefault false;
    enableIPv6 = false;
    firewall.enable = false;
    wireless.enable = false;

    #
    # use quad9 dns to avoid any dependency-circle
    # with pi-hole for the rest of the network.
    #
    nameservers = [ "9.9.9.9" "142.112.112.112" ];

    interfaces = {
      enp2s0f0 = {
        ipv4.addresses = [
          { address = "192.168.2.8"; prefixLength = 24; }
        ];
      };
    };

    defaultGateway = "192.168.2.1";
  };
}

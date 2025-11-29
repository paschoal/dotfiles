{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "gram";
    useDHCP = lib.mkDefault true;

    firewall.enable = false;
    wireless.enable = false;
    enableIPv6 = false;
  };

  services.resolved.enable = true;
}

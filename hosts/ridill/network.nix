{ config, lib, pkgs, ... }:
{
  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    hostName = "ridill";
    useDHCP = lib.mkDefault true;
    firewall.enable = false;
  };

  services.resolved.enable = false;
}

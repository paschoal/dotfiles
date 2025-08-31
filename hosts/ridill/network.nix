{ config, lib, pkgs, ... }:
{
  networking = {
    hostName = "ridill";
    useDHCP = lib.mkDefault true;
    firewall.enable = false;
  };
}

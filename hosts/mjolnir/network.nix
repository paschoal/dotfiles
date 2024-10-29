{ config, lib, pkgs, ... }:

{
  networking.hostName = "mjolnir";
  networking.useDHCP = lib.mkDefault true;
  networking.firewall.enable = true;
  networking.hosts = {
    "192.168.88.33" = ["laevateinn"];
    "192.168.88.13" = ["headset"];
  };
}

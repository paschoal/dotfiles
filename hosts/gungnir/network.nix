{ config, lib, ... }:

{
  imports = [
    <agenix/modules/age.nix>
  ];

  age = {
    secrets = {
      wifi-networks.file = ../../secrets/wifi-networks.age;
    };
    identityPaths = ["/data/home/.ssh/id_rsa"];
  };

  networking.hostName = "gungnir";
  networking.firewall.enable = true;
  networking.useDHCP = lib.mkDefault true;

  networking.hosts = {};

  networking.wireless = {
    enable = true;
    secretsFile = config.age.secrets.wifi-networks.path;
    networks."UairelessMov".pskRaw = "ext:UairelessMov";
    networks."Uaireless".pskRaw = "ext:Uaireless";
    networks."Wireless".pskRaw = "ext:Wireless";
    networks."Wireless-5G".pskRaw = "ext:Wireless";
  };
}

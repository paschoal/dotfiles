{ config, lib, pkgs, ... }:

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
  };
}

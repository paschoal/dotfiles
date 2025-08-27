{ config, lib, pkgs, ... }:
{
  imports = [ <agenix/modules/age.nix> ];

  age = {
    secrets = {
      wifi-networks.file = ../../secrets/wifi-networks.age;
    };
    identityPaths = [ "/data/home/.ssh/id_rsa" ];
  };

  networking = {
    hostName = "tyrfing";
    useDHCP = lib.mkDefault true;
    firewall.enable = false;
    wireless = {
      userControlled.enable = true;
      secretsFile = config.age.secrets.wifi-networks.path;
      enable = true;
      networks."Uaireless 2.4G".pskRaw = "ext:Uaireless";
    };
  };
}

{ config, lib, pkgs, ... }:

{
  imports = [
    <agenix/modules/age.nix>
  ];

  age = {
    secrets = {
      wireguard-private-key.file = ../../secrets/wireguard-private-key.age;
      wireguard-public-key.file = ../../secrets/wireguard-public-key.age;
      wireguard-preshared-key.file = ../../secrets/wireguard-preshared-key.age;
    };
    identityPaths = [ "/data/home/.ssh/id_rsa" ];
  };

  networking.hostName = "mjolnir";
  networking.useDHCP = lib.mkDefault true;

  networking.firewall = {
    enable = false;
  };

  networking.hosts = {
    "" = ["laevateinn"];
  };

  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

  networking.wireguard = {
    enable = false;
    interfaces = {
      wg0 = {
        ips = [ "" "" ];
        privateKeyFile = config.age.secrets.wireguard-private-key.path;
        peers = [
          {
            publicKeyFile = config.age.secrets.wireguard-public-key.path;
            presharedKeyFile = config.age.secrets.wireguard-preshared-key.path;
            allowedIPs = [ "0.0.0.0/0" "::/0" ];
            endpoint = "";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}

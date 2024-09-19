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

  networking.hosts = {
  };

  networking.wireless = {
    enable = true;
    environmentFile = config.age.secrets.wifi-networks.path;
    networks."UARILESS_2G".psk = "@PSK_UARILESS_2G@";
    networks."Rename 51".psk = "@PSK_RENAME_51@";
    networks."Rename 51 5G".psk = "@PSK_RENAME_51@";
    networks."Uaireless".psk = "@PSK_UAIRELESS@";
    networks."Uaireless 2.4G".psk = "@PSK_UAIRELESS_2_4_G@";
  };
}

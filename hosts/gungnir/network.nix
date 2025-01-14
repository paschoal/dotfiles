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
    secretsFile = config.age.secrets.wifi-networks.path;
    networks."UairelessMov".psk = "41335C66";
  };

  # networking.networkmanager.ensureProfiles = {
  #   environmentFiles = [
  #     config.age.secrets.wifi-networks.path
  #   ];

  #   profiles = {
  #     uairelessMov = {
  #       connection = {
  #         id = "uairelessMov";
  #         type = "wifi";
  #       };

  #       ipv4.method = "auto";
  #       ipv6.method = "auto";

  #       wifi = {
  #         mode = "infrastructure";
  #         ssid = "UairelessMov";
  #       };

  #       wifi-security = {
  #         key-mgmt = "wpa-psk";
  #         psk = "$uaireless_mov";
  #       };
  #     };
  #   };
  # };
}

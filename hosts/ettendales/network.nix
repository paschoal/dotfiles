{ config, lib, ... }:

{
  imports = [
    <agenix/modules/age.nix>
  ];

  age = {
    secrets = {
      wifi-uaireless-2-4g.file = ../../secrets/wifi-uaireless-2-4g.age;
    };
    identityPaths = ["/data/home/.ssh/id_rsa"];
  };

  networking.hostName = "ettendales";
  networking.firewall.enable = false;
  networking.useDHCP = lib.mkDefault true;
  networking.wireless = {
    enable = true;
    environmentFile = config.age.secrets.wifi-uaireless-2-4g.path;
    networks."Uaireless 2.4G".psk = "@PSK_UAIRELESS_2_4G@";
  };
}

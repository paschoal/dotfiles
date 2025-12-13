{ config, pkgs, lib, ... }:

{
  #
  # available through nixos-container bin.
  #
  containers.postgres = {
    autoStart = false;
    privateNetwork = true;

    hostAddress = "192.168.3.2";
    localAddress = "192.168.3.3";

    config = { config, pkgs, lib, ... }: {
      services.postgresql = {
        enable = true;
        enableTCPIP = true;
        authentication = pkgs.lib.mkOverride 10 ''
          local all all trust
          host  all all 0.0.0.0/0 trust
        '';
      };

      networking = {
        hostName = "postgres";
        firewall.allowedTCPPorts = [ 5432 ];
      };

      system.stateVersion = "25.11";
    };
  };
}

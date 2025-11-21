{ config, pkgs, lib, ... }:
{
  #
  # available through nixos-container bin.
  #
  containers.valkey = {
    autoStart = false;
    privateNetwork = true;

    hostAddress = "192.168.3.2";
    localAddress = "192.168.3.4";

    config = { config, pkgs, lib, ... }: {
      environment.systemPackages = with pkgs; [ valkey ];

      systemd.services.valkey = {
        description = "Valkey data structure server";
        enable = true;
        wants = [ "network-online.target" ];
        after = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.valkey}/bin/valkey-server --supervised systemd --daemonize no --protected-mode no";
          UMask = "0077";
          Type = "notify";
          TimeoutStartSec = "infinity";
          TimeoutStopSec = "infinity";
          NoNewPrivileges = "yes";
          LimitNOFILE = 10032;
        };
      };

      networking = {
        hostName = "valkey";
        firewall.enable = false;
      };

      system.stateVersion = "25.11";
    };
  };
}

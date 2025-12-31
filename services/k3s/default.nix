{ config, pkgs, lib, ... }:

{
  options = {
    k3s-config = {
      role = lib.mkOption {
        default = "agent";
        type = lib.types.raw;
        description = ''
          Specify K3S server role
        '';
      };

      serverAddress = lib.mkOption {
        type = lib.types.raw;
        description = ''
          K3S server address
        '';
      };

      environmentFile = lib.mkOption {
        type = lib.types.path;
        description = ''
          Environment ilfe to be used as configuration
        '';
      };
    };
  };

  config = {
    services = {
      k3s = lib.mkMerge [
        {
          enable = true;
          role = config.k3s-config.role;
          environmentFile = config.k3s-config.environmentFile;
        }

        (
          lib.mkIf (config.k3s-config.role != "server") {
            serverAddr = config.k3s-config.serverAddress;
          }
        )

        (
          lib.mkIf ( config.k3s-config.role == "server") {
            disable = [
              "metrics-server"
              "traefik"
              "servicelb"
            ];
            extraFlags = [ "--write-kubeconfig-mode 644" ];
            manifests = {
              longhorn.source = pkgs.fetchurl {
                url = "https://raw.githubusercontent.com/longhorn/longhorn/v1.10.1/deploy/longhorn.yaml";
                hash = "sha256-nc0kcrAJ5GhCT8cIgC5KOg4eCIDkSt1gNewkJtMSmUo=";
              };

              metallb.source = pkgs.fetchurl {
                url = "https://raw.githubusercontent.com/metallb/metallb/v0.15.3/config/manifests/metallb-native.yaml";
                hash = "sha256-hLThAvK2X11pCF9YFsKTYrdGQYc9isPemW5fhqghkXY=";
              };
            };
          }
        )
      ];

      #
      # https://github.com/longhorn/longhorn/issues/2166#issuecomment-2994323945
      #
      openiscsi = {
        enable = true;
        name = "${config.networking.hostName}-initiatorhost";
      };
    };

    systemd.services.iscsid.serviceConfig = {
      PrivateMounts = "yes";
      BindPaths = "/run/current-system/sw/bin:/bin";
    };

    environment.systemPackages = [ ];
  };
}

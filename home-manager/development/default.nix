{ config, pkgs, lib, ... }:

{
  options = {
    development = {
      sql = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable SQL tools
            '';
        };
      };

      coding-agent = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable agent tools
          '';
        };
      };

      helm = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable helm and supporting tools
          '';
        };
      };

      dia = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable DIA
          '';
        };
      };

      sops = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable SOPS client
          '';
        };
      };

      gcp = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable Google Cloud Platform CLI
          '';
        };
      };

      k8s = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Enable Kubernetes CLI
          '';
        };
      };
    };
  };

  config = {
    home.packages = with pkgs; lib.mkMerge [
      [
        hurl
      ]

      (
        lib.mkIf config.development.gcp.enable [
          (
            google-cloud-sdk.withExtraComponents [
              google-cloud-sdk.components.gke-gcloud-auth-plugin
            ]
          )
        ]
      )

      (
        lib.mkIf config.development.k8s.enable [
          kubernetes
        ]
      )

      (
        lib.mkIf config.development.sops.enable [
          sops
        ]
      )

      (
        lib.mkIf config.development.dia.enable [
          dia
        ]
      )

      (
        lib.mkIf config.development.helm.enable [
          helmfile
          (
            wrapHelm kubernetes-helm {
              plugins = with pkgs.kubernetes-helmPlugins; [
                helm-secrets
                helm-diff
                helm-git
              ];
            }
          )
        ]
      )

      (
        lib.mkIf config.development.sql.enable [
          postgresql
          dbeaver-bin
        ]
      )

      (
        lib.mkIf config.development.coding-agent.enable [
          github-copilot-cli
          opencode
        ]
      )
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

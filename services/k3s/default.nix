{ config, pkgs, lib, ... }:

let
  kube-from-nix = pkgs.writeScriptBin "kbnix" ''
    #!${pkgs.stdenv.shell}
    apply () {
      local filename="$1"
      nix eval --file "$filename" --json | kubectl apply -f -
    }

    delete () {
      local filename="$1"
      nix eval --file "$filename" --json | kubectl delete -f -
    }

    if [ "$#" -lt 2 ]; then
      echo "Usage: $0 [COMMAND] [FILENAME]"
      echo "Evaluate [FILENAME] from nix to json and use as input to kubectl [COMMAND]"
    fi

    case "$1" in
      apply)
        apply "$2"
        ;;
      delete)
        delete "$2"
        ;;
      *)
    esac
  '';
in {
  options = {
    k3s-config = {
      role = lib.mkOption {
        default = "agent";
        type = lib.types.raw;
        description = ''
          Specify K3S server role
        '';
      };

      server-address = lib.mkOption {
        type = lib.types.raw;
        description = ''
          K3S server address
        '';
      };

      token = lib.mkOption {
        type = lib.types.raw;
        description = ''
          K3S server token
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
        }

        (
          lib.mkIf (config.k3s-config.role != "server") {
            serverAddr = config.k3s-config.server-address;
            token = config.k3s-config.token;
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
          }
        )
      ];
    };
    environment.systemPackages = [ kube-from-nix ];
  };
}

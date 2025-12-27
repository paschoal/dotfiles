{ pkgs, ... }:

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
  services = {
    k3s = {
      enable = true;
      role = "server";
      disable = [
        "metrics-server"
        "traefik"
        "servicelb"
      ];
      extraFlags = [
        "--write-kubeconfig-mode 644"
      ];
    };
  };

  environment.systemPackages = [ kube-from-nix ];
}

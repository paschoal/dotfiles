{ config, ... }:
let
  commit = "61b39c7";
  tar = builtins.fetchTarball {
    url = "https://github.com/Mic92/sops-nix/archive/${commit}.tar.gz";
    sha256 = "0i6rncwj4xa6qzysrfrp0cg1gmb1v44xgarrzj8sr3ns2z3h0zx6";
  };

in {
  imports = [ "${tar}/modules/sops" ];

  sops.defaultSopsFile = ./secrets.yaml;

  sops.age.sshKeyPaths = [
    "/data/home/.ssh/paschoal@bree"
    "/data/home/.ssh/paschoal@drun"
    "/data/home/.ssh/paschoal@celos"
  ];
  sops.age.generateKey = true;

  sops.secrets."beszel/key" = {};
  sops.secrets."beszel/bree/token" = {};
  sops.secrets."beszel/drun/token" = {};
  sops.secrets."beszel/celos/token" = {};
  sops.secrets."k3s/celos/token" = {};

  sops.templates."bree/beszel-agent.env".content = ''
    KEY=${config.sops.placeholder."beszel/key"}
    TOKEN=${config.sops.placeholder."beszel/bree/token"}
  '';

  sops.templates."drun/beszel-agent.env".content = ''
    KEY=${config.sops.placeholder."beszel/key"}
    TOKEN=${config.sops.placeholder."beszel/drun/token"}
  '';

  sops.templates."celos/beszel-agent.env".content = ''
    KEY=${config.sops.placeholder."beszel/key"}
    TOKEN=${config.sops.placeholder."beszel/celos/token"}
  '';

  sops.templates."celos/k3s.env".content = ''
    K3S_TOKEN=${config.sops.placeholder."k3s/celos/token"}
  '';
}

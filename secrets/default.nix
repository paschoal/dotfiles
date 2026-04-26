{ config, ... }:
let
  commit = "3e0d543";
  tar = builtins.fetchTarball {
    url = "https://github.com/Mic92/sops-nix/archive/${commit}.tar.gz";
    sha256 = "0s06zk9psh0v27ggvw09c74dqgz7n72k4ddj7vzafx6jh2bfxi6f";
  };

in {
  imports = [ "${tar}/modules/sops" ];

  sops.defaultSopsFile = ./secrets.yaml;

  sops.age.sshKeyPaths = [
    "/data/home/.ssh/paschoal@drun"
    "/data/home/.ssh/paschoal@celos"
  ];
  sops.age.generateKey = true;

  sops.secrets."k3s/celos/token" = {};

  sops.templates."celos/k3s.env".content = ''
    K3S_TOKEN=${config.sops.placeholder."k3s/celos/token"}
  '';
}

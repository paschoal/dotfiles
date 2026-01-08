{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix

    ../../secrets
    ../../common
    ../../nixos/services/openssh
    ../../nixos/services/beszel-agent
    ../../nixos/services/k3s
  ];

  k3s-config = {
    role = "agent";
    #
    # drun static ip
    #
    serverAddress = "https://192.168.2.10:6443";
  };

  k3s-config.environmentFile = config.sops.templates."celos/k3s.env".path;

  beszel-config = {
    extraFileSystems = "sdd1__sata_disk1,/storage";
    skipGPU = "true";
    skipSystemd = "true";
    environmentFile = config.sops.templates."celos/beszel-agent.env".path;
  };

  nix.settings.experimental-features = [ "nix-command" ];

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "input" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB8CDBv3wnN+q4rYcGAa7YlS3+joODlUv7dlQll9f98s paschoal@bree"
    ];
  };

  services.openssh.settings.AllowUsers = [ "paschoal" ];

  security = {
    rtkit.enable = true;
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  system.stateVersion = "25.05";
}

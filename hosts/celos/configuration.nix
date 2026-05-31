{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix

    ../../secrets
    ../../nixos/common
    ../../nixos/services/openssh
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

  nix.settings.experimental-features = [ "nix-command" ];

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "input" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPyNEYI+nFbe/vWm0dCot39wEMjHjr3ji9rGwBhNR/cw paschoal@bree"
    ];
  };

  services.openssh.settings.AllowUsers = [ "paschoal" ];

  environment.systemPackages = with pkgs; [
    nfs-utils
    sshfs
  ];

  security = {
    rtkit.enable = true;
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  system.stateVersion = "25.05";
}

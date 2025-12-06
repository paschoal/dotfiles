{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix
    ../../common
    ../../locale

    ../../services/openssh
    ../../services/k3s
  ];

  nix.settings.experimental-features = [ "nix-command" ];

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "input" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
  };

  security = {
    rtkit.enable = true;
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  system.stateVersion = "25.05";
}

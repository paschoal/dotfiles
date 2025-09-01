{ config, lib, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale

    ../../services/openssh
  ];

  security = {
    sudo.wheelNeedsPassword = false;
  };

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
    openssh.authorizedKeys.keys = [
    	(builtins.readFile ../../services/openssh/pub/paschoal)
    ];
  };

  system.stateVersion = "25.11";
}

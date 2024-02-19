{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix

    ../../common
    ../../locale

    <home-manager/nixos>
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    createHome = true;
    home = "/data/home";
  };

  security = {
    rtkit.enable = true;

    sudo = {
      wheelNeedsPassword = false;
    };
  };

  system.stateVersion = "23.11";
}

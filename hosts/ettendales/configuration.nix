{ pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>

      ./hardware.nix
      ./network.nix

      ../../common
      ../../nixos/services/openssh
      ../../nixos/services/klipper
    ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    createHome = true;
    home = "/data/home";
  };

  security = {
    polkit.enable = true;

    sudo = {
      wheelNeedsPassword = false;
    };
  };

  system.stateVersion = "24.05";
}


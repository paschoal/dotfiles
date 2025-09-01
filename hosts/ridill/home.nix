{ config, pkgs, lib, ... }:
{
  git-config.sign-gpg = false;

  imports = [
    ../../config/git
      ../../config/fish
      ../../config/nvim/minimal.nix
  ];

  home = {
    username = "paschoal";
    homeDirectory = "/data/home";
    sessionPath = [ "/data/home/bin" ];
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [ bat ];
  };

  programs = {
    home-manager.enable = true;
  };

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}


{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}

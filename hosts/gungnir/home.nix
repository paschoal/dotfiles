{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/wofi
    ../../config/nvim
    ../../config/cursor
    ../../config/kitty
    ../../config/kitty-font/gungnir
    ../../config/aws-vault
    ../../config/wallpapers

    ../../config/qutebrowser/gungnir
    ../../config/eww/gungnir
    ../../config/hypr/gungnir
  ];

  home.packages = with pkgs; [
    docker-compose
    bat
    pass
    vlc
    feh
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}

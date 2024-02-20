{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";

  imports = [
    ../../config/git
    ../../config/zsh
    ../../config/wofi
    ../../config/nvim
    ../../config/cursor
    ../../config/kitty
    ../../config/aws-vault
    ../../config/wallpapers

    ../../config/qutebrowser/gungnir
    ../../config/eww/gungnir
    ../../config/hypr/gungnir
  ];

  home.packages = [
    pkgs.docker-compose
    pkgs.monoid
    pkgs.bat
    pkgs.pass
    pkgs.httpie
    pkgs.dbeaver
    pkgs.postgresql
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}

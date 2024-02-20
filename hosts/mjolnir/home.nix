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

    ../../config/qutebrowser/mjolnir
    ../../config/eww/mjolnir
    ../../config/hypr/mjolnir
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "awscli2"
  ];

  home.packages = [
    pkgs.docker-compose
    pkgs.monoid
    pkgs.bat
    pkgs.pass
    pkgs.discord
    pkgs.httpie
    pkgs.dbeaver
    pkgs.postgresql
    pkgs.google-cloud-sdk
    pkgs.sops
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}

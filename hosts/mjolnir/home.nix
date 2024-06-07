{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [
    "/data/home/bin"
  ];

  screenshots = {
    folder = "/data/home/screenshots";
    bin = "/data/home/bin";
  };

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/wofi
    ../../config/nvim
    ../../config/cursor
    ../../config/kitty
    ../../config/kitty-font/mjolnir
    ../../config/aws-vault
    ../../config/wallpapers
    ../../config/screenshot
    ../../config/notes

    ../../games/wow

    ../../config/qutebrowser/mjolnir
    ../../config/eww/mjolnir
    ../../config/hypr/mjolnir
    ../../config/manufact
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "awscli2"
    "obsidian"
  ];

  home.packages = with pkgs; [
    docker-compose
    bat
    pass
    discord
    vlc
    feh
  ];

  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };
  };

}

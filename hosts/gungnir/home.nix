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
    ../../config/kitty-font/gungnir
    ../../config/aws-vault
    ../../config/wallpapers
    ../../config/screenshot
    ../../config/notes

    ../../config/qutebrowser/gungnir
    ../../config/eww/gungnir
    ../../config/hypr/gungnir
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

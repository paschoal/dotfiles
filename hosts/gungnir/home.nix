{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/nvim
    ../../config/aws-vault

    ../../config/qutebrowser/gungnir
    ../../config/wallpapers

    ../../config/sxhkd/gungnir/i3
    ../../config/i3/gungnir

    ../../config/alacritty
    ../../config/cursor
    ../../config/rofi
    ../../config/polybar/gungnir
    ../../config/screenshot/flameshot
    ../../config/dunst
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"

    "awscli2"
    "terraform"
    "apple_cursor"
  ];

  home.packages = with pkgs; [
    docker-compose
    bat
    pass
    discord
    vlc
    feh
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  xdg.userDirs = {
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/desktop";
    download = "${config.home.homeDirectory}/downloads";
    pictures = "${config.home.homeDirectory}/screenshots";
  };

  screenshots = {
    folder = config.xdg.userDirs.pictures;
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}

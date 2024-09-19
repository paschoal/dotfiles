{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [
    "/data/home/bin"
  ];

  # screenshot = {
  #  folder = "${config.home.homeDirectory}/screenshot";
  # };

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/nvim
    # ../../config/aws-vault
    ../../config/qutebrowser/gungnir
    ../../config/i3/gungnir
    ../../config/alacritty
    ../../config/cursor
    ../../config/wallpapers
    ../../config/polybar/gungnir
    ../../config/rofi
    ../../config/clipmenu
    # ../../config/screenshot/flameshot
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

   xdg.userDirs = {
   };

  fonts.fontconfig.enable = true;
}

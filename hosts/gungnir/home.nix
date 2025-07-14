{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  sxhkd-config = {
    rofi = true;
    bspwm = true;
  };

  imports = [
    ../../config/git
    ../../config/development
    ../../config/zsh
    ../../config/nvim
    ../../config/aws-vault

    ../../config/wallpapers

    ../../config/sxhkd
    ../../config/bspwm
    ../../config/eww/gungnir

    ../../config/qutebrowser/gungnir

    ../../config/feh
    ../../config/st
    ../../config/cursor
    ../../config/rofi
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
    nemo
    feh
    zathura
    xclip
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  xdg = {
    userDirs = {
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      download = "${config.home.homeDirectory}/downloads";
      pictures = "${config.home.homeDirectory}/screenshots";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "applications/pdf" = [ "zathura.desktop" ];
        "inode/directory" = [ "nemo.desktop" ];
      };
    };
  };

  screenshots = {
    folder = config.xdg.userDirs.pictures;
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}

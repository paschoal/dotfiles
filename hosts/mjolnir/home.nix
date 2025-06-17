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

    ../../games/wow
    ../../games/eve
    ../../config/mangohud

    ../../config/manufact
    ../../config/qutebrowser/mjolnir
    ../../config/wallpapers

    ../../config/sxhkd
    ../../config/bspwm
    ../../config/eww/mjolnir

    ../../config/st
    ../../config/cursor
    ../../config/rofi
    ../../config/screenshot/flameshot
    ../../config/clementine
    ../../config/dunst
    ../../config/ranger
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
    zathura
  ];

  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  xdg = {
    cacheHome = "${config.home.homeDirectory}/.cache";
    userDirs = {
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      pictures = "${config.home.homeDirectory}/screenshots";
    };
    mimeApps = {
      defaultApplications = {
        "application/pdf" = ["zathura.desktop"];
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

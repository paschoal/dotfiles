{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  sxhkd-config = {
    rofi = true;
    bspwm = true;
  };

  qutebrowser-config.small-screen = true;

  imports = [
    ../../config/git
    ../../config/development
    ../../config/fish
    ../../config/nvim

    ../../config/wallpapers

    ../../config/sxhkd
    ../../config/bspwm
    ../../config/eww/gungnir

    ../../config/qutebrowser
    ../../config/thunderbird

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
    bat
    pass
    discord
    vlc
    nemo
    zathura
    xclip
    unzip
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  xdg = {
    cacheHome = "${config.home.homeDirectory}/.cache";
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
        "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
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

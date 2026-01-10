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
  st-config.small-screen = true;

  eww = {
    enable = true;
    width = 1900;
    modules = {
      date = true;
      clock = true;
      bspwm = true;
      volume = true;
      wireplumber = true;
      battery = true;
      wifi = true;
    };
    left = [ "wireplumber" "volume" "wifi" ];
    center = [ "bspwm" ];
    right = [ "battery" "date" "clock" ];
  };

  imports = [
    ../../home-manager/git
    ../../home-manager/development
    ../../home-manager/fish
    ../../home-manager/nvim
    ../../home-manager/tmux

    ../../home-manager/wallpapers

    ../../home-manager/sxhkd
    ../../home-manager/bspwm
    ../../home-manager/eww

    ../../home-manager/qutebrowser

    ../../home-manager/feh
    ../../home-manager/st
    ../../home-manager/cursor
    ../../home-manager/rofi
    ../../home-manager/screenshot/flameshot
    ../../home-manager/dunst
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
    mons
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
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.default.common = [ "gtk" ];
    };
  };

  screenshots = {
    folder = config.xdg.userDirs.pictures;
  };

  news.display = "silent";
  programs.home-manager.enable = true;

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}

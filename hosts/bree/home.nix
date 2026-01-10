{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  bspwm-config = {
    steam-games-fullscreen = true;
    steam-games-library = /data/home/.steam;
  };

  sxhkd-config = {
    rofi = true;
    bspwm = true;
  };

  eww = {
    enable = true;
    width = 2536;
    modules = {
      date = true;
      clock = true;
      bspwm = true;
      volume = true;
      wireplumber = true;
    };
    left = [ "wireplumber" "volume" ];
    center = [ "bspwm" ];
    right = [ "date" "clock" ];
  };

  imports = [
    ../../home-manager/git
    ../../home-manager/development
    ../../home-manager/fish
    ../../home-manager/nvim
    ../../home-manager/tmux

    #
    # build is taking heck of long time
    # need to eval why
    #
    ../../home-manager/manufact

    ../../home-manager/wallpapers

    ../../home-manager/sxhkd
    ../../home-manager/bspwm
    ../../home-manager/eww

    ../../home-manager/qutebrowser
    ../../home-manager/chromium
    ../../home-manager/thunderbird

    ../../home-manager/games/openttd

    ../../home-manager/feh
    ../../home-manager/st
    ../../home-manager/cursor
    ../../home-manager/rofi
    ../../home-manager/screenshot/flameshot
    ../../home-manager/dunst

    ../../home-manager/calibre
    ../../home-manager/nicotine
    ../../home-manager/picard
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "awscli2"
    "terraform"
    "apple_cursor"
    "winbox"
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
    winbox4
    bitwarden-cli
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
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "zathura.desktop" ];
        "inode/directory" = [ "nemo.desktop" ];
        "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
      };
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

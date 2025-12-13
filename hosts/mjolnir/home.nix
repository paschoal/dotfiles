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

  imports = [
    ../../config/git
    ../../config/development
    ../../config/lazydocker
    ../../config/fish
    ../../config/nvim
    ../../config/tmux

    #
    # build is taking heck of long time
    # need to eval why
    #
    ../../config/manufact

    ../../config/wallpapers

    ../../config/sxhkd
    ../../config/bspwm
    ../../config/eww/mjolnir

    ../../config/qutebrowser
    ../../config/chromium
    ../../config/thunderbird

    ../../config/feh
    ../../config/st
    ../../config/cursor
    ../../config/rofi
    ../../config/screenshot/flameshot
    ../../config/dunst

    ../../config/calibre
    ../../config/nicotine
    ../../config/picard
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

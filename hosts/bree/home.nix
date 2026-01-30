{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  imports = [
    ../../home-manager/git
    ../../home-manager/development
    ../../home-manager/fish
    ../../home-manager/nvim

    #
    # build is taking heck of long time
    # need to eval why
    #
    ../../home-manager/manufact

    ../../home-manager/niri
    ../../home-manager/fuzzel
    ../../home-manager/fuzzel-password-manager
    ../../home-manager/foot

    ../../home-manager/qutebrowser
    ../../home-manager/chromium
    ../../home-manager/thunderbird

    ../../home-manager/games/openttd

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
    unzip
    winbox4
    imv
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
    portal.config.common.default = [ "gtk" ];
  };

  news.display = "silent";
  programs.home-manager.enable = true;

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}

{ lib, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.paschoal = { config, pkgs, ... }: {
    imports = [
      ../../home-manager/git
      ../../home-manager/fish
      ../../home-manager/nvim
      ../../home-manager/tmux

      ../../home-manager/eww
      ../../home-manager/niri

      ../../home-manager/swaybg
      ../../home-manager/wallpapers
      ../../home-manager/fuzzel
      ../../home-manager/fuzzel-password-manager
      ../../home-manager/foot
      ../../home-manager/qutebrowser
      ../../home-manager/nomacs

      ../../home-manager/development
    ];

    wallpaper.image = "/home/paschoal/.wallpaper/landscape.jpg";

    development = {
      sops.enable = true;
      gcp.enable = true;
      k8s.enable = true;
    };

    qutebrowser-config.small-screen = true;

    eww = {
      enable = true;
      daemon-systemd = true;
      modules = {
        battery = true;
        wireplumber = true;
        clock = true;
        date = true;
      };
      left = [ "battery" "wireplumber" ];
      right = [ "date" "clock" ];
    };

    niri = {
      status-bar.launch = config.eww.launch;
    };

    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "discord"
      ];
    };

    home.packages = with pkgs; [
      bat
      vlc
      zathura
      imv
      discord
    ];

    xdg = {
      cacheHome = "/home/paschoal/.cache";
      userDirs = {
        createDirectories = true;
        desktop = "/home/paschoal/desktop";
        documents = "/home/paschoal/documents";
        download = "/home/paschoal/downloads";
        pictures = "/home/paschoal/screenshots";
      };
      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/pdf" = [ "zathura.desktop" ];
          "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
          "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
        };
      };
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home.enableNixpkgsReleaseCheck = false;
    home.stateVersion = "26.11";

    news.display = "silent";
    services.home-manager.autoExpire = {
      enable = true;
      frequency = "weekly";
      store.cleanup = true;
    };
  };
}

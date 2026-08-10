{ lib, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.paschoal = { pkgs, ... }: {
    wallpaper.image = "/home/paschoal/.wallpaper/landscape.jpg";

    imports = [
      ../../home-manager/git
      ../../home-manager/fish
      ../../home-manager/nvim
      ../../home-manager/tmux

      ../../home-manager/niri
      ../../home-manager/swaybg
      ../../home-manager/wallpapers
      ../../home-manager/fuzzel
      ../../home-manager/fuzzel-password-manager
      ../../home-manager/foot
      ../../home-manager/waybar
      ../../home-manager/qutebrowser
    ];

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
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/pdf" = [ "zathura.desktop" ];
          "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
          "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
        };
      };
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

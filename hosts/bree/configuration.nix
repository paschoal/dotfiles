{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./audio.nix
    ./network.nix

    ../../secrets
    ../../nixos/common
    ../../nixos/graphical/niri
    ../../nixos/games
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam-unwrapped"
    "steam"
    "steam-original"
    "steam-run"
  ];

  nix.settings.experimental-features = [ "nix-command" ];
  programs = {
    dconf.enable = true;
    nix-index.enable = true;
    ydotool.enable = true;
  };

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "input" "ydotool" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
  };

  security = {
    rtkit.enable = true;

    sudo = {
      wheelNeedsPassword = false;
    };
  };

  services = {
    #
    # d-bus interface to query and manipulate
    # storage devices
    #
    # provides udiskctl to mount storages instead
    # of regular mount
    #
    udisks2.enable = true;

    #
    # middleware for power management
    # maintains statistics and history data
    # provides upower cli
    #
    upower.enable = true;
  };

  system.stateVersion = "25.11";
}

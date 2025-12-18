{ lib, pkgs, ... }:

{
  xorg-config.amd = true;

  imports = [
    <home-manager/nixos>
    <agenix/modules/age.nix>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale
    ../../games
    ../../graphical/bspwm

    ../../virtualisation/docker
    ../../virtualisation/valkey.nix
    ../../virtualisation/postgres.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam-unwrapped"
    "steam"
    "steam-original"
    "steam-run"
    "open-webui"
  ];

  nix.settings.experimental-features = [ "nix-command" ];
  programs = {
    dconf.enable = true;
    nix-index.enable = true;
  };

  users.users.paschoal = {
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "input" ];
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

  environment.systemPackages = with pkgs; [
    (callPackage <agenix/pkgs/agenix.nix> {})
    yubikey-manager
  ];

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

  system.stateVersion = "24.05";
}

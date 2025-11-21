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

    ../../virtualisation/postgres.nix
    ../../virtualisation/valkey.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam-unwrapped"
    "steam"
    "steam-original"
    "steam-run"
    "open-webui"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.dconf.enable = true;

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

  fonts.packages = with pkgs; [
    iosevka
    monoid
    nerd-fonts.iosevka
    nerd-fonts.monoid
  ];

  environment.systemPackages = with pkgs; [
    (callPackage <agenix/pkgs/agenix.nix> {})
  ];
  services.udisks2.enable = true;

  system.stateVersion = "24.05";
}

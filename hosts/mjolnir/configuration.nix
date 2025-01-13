{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale
    ../../games
    ../../graphical/bspwm
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  programs.dconf.enable = true;


  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = ["wheel" "input"];
    shell = pkgs.zsh;
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
  ];

  environment.systemPackages = with pkgs; [
    flameshot
  ];

  system.stateVersion = "24.05";
}

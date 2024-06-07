{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix

    ../../common
    ../../graphical/hyprland
    ../../graphical/greetd
    ../../locale
    ../../games

    <home-manager/nixos>
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "audio" "input"];
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

  system.stateVersion = "24.05";

  fonts.packages = with pkgs; [
    iosevka
  ];
}

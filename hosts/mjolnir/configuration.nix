{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale
    ../../games
    ../../graphical/i3
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "audio" "input" "vboxusers"];
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

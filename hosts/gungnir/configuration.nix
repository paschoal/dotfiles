{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    <agenix/modules/age.nix>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale
    ../../graphical/bspwm
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.dconf.enable = true;

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

  environment.systemPackages = [
    (pkgs.callPackage <agenix/pkgs/agenix.nix> {})
  ];

  system.stateVersion = "24.05";

  fonts.packages = with pkgs; [
    iosevka
    monoid
    nerd-fonts.iosevka
    nerd-fonts.monoid
  ];
}

{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./hardware.nix
    ./network.nix
    ../../common
    ../../locale
    ../../services/openssh
  ];

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

  environment.systemPackages = with pkgs; [];
  system.stateVersion = "25.05";
}

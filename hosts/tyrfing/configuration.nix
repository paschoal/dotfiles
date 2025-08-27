{ config, lib, pkgs, ... }:

{
  imports = [
    <agenix/modules/age.nix>
    <home-manager/nixos>
    ./hardware.nix
    ./network.nix
    ../../common
    ../../locale
    ../../services/openssh
  ];

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "plugdev" ];
    shell = pkgs.fish;
    createHome = true;
    packages = with pkgs; [ neovim ];
    home = "/data/home";
  };

  environment.systemPackages = with pkgs; [
    (callPackage <agenix/pkgs/agenix.nix> {})
    (callPackage ../../derivations/libcamera {})
  ];

  system.stateVersion = "25.11";
}

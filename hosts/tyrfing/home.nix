{ config, pkgs, lib, ... }:
{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [ "/data/home/bin" ];

  imports = [
    ../../config/git
    ../../config/fish
    ../../config/nvim
  ];

  home.packages = with pkgs; [
    bat
  ];

  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}

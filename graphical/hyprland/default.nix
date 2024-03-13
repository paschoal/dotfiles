{ config, libs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    wl-clipboard
    xdg-utils
    xdg-desktop-portal-hyprland
  ];

  programs = {
    hyprland = {
      enable = true;
    };
    xwayland = {
      enable = true;
    };
  };
}

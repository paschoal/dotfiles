{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Matheus Paschoal";
    userEmail = "paschoal@gmail.com";
    extraConfig = {
      color = {
        ui = true;
        pager = true;
      };
      rerere = {
        enabled = true;
      };
    };
  };
}

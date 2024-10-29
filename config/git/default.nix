{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Matheus Paschoal";
    userEmail = "paschoal@gmail.com";
    extraConfig = {
      user.signingKey = "734F62B31D556B2D";
      commit.gpgsign = true;
      rerere.enabled = true;
      color = {
        ui = true;
        pager = true;
      };
    };
  };
}

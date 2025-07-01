{ config, pkgs, ... }:

let
  stable-pkgs = import <nixos-stable> {};
in {
  home.packages = with stable-pkgs; [ dbeaver-bin ];
}

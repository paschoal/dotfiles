{ config, pkgs, ... }:

let
  stable-pkgs = import <nixos-stable> {};
  in {
    home.packages = [
      pkgs.google-cloud-sdk
      pkgs.ruby_3_3
      pkgs.postgresql
      stable-pkgs.dbeaver-bin
    ];
  }

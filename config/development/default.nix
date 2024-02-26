{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.google-cloud-sdk
    pkgs.ruby_3_3
    pkgs.postgresql
    pkgs.dbeaver
    pkgs.httpie
    pkgs.sops
  ];
}

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-cloud-sdk
    ruby_3_3
    postgresql
    dbeaver-bin
  ];
}

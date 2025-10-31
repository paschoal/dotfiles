{ config, pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [ "libsoup-2.74.3" ];

  home.packages = with pkgs; [
    freecad
    orca-slicer
  ];
}

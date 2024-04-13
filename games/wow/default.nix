{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/weakauras
    ./addons/opie
    ./addons/dominos
    ./addons/suf
    ./addons/details
    ./addons/advanced-interface-options
    ./addons/simulationcraft
    ./addons/plater
    ./addons/tomtom

    ./logs
  ];
}

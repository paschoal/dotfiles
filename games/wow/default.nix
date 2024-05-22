{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/weakauras
    ./addons/opie
    ./addons/details
    ./addons/advanced-interface-options
    ./addons/simulationcraft
    ./addons/plater
    ./addons/littlewigs
    ./addons/bigwigs
    ./addons/tomtom
    ./addons/leatrix-plus

    ./logs
  ];
}

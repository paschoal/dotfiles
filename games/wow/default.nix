{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/auctionator
    ./addons/advanced-interface-options
    ./addons/loot-appraiser
    ./addons/weakauras
    ./addons/opie
    ./addons/details
    ./addons/simulationcraft
    ./addons/plater
    ./addons/littlewigs
    ./addons/bigwigs
    ./addons/tomtom
    ./addons/leatrix-plus
    ./addons/dialogue-ui

    ./logs
  ];
}

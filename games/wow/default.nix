{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/auctionator
    ./addons/loot-appraiser
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
    ./addons/narcissus
    ./addons/dialogue-ui

    ./logs
  ];
}

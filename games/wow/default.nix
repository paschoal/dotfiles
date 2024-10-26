{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/no-auto-close
    ./addons/blizzmove
    ./addons/better-fishing
    ./addons/addon-usage
    ./addons/shadowed-unit-frames
    ./addons/auctionator
    ./addons/advanced-interface-options
    ./addons/weakauras
    ./addons/opie
    ./addons/details
    ./addons/simulationcraft
    ./addons/littlewigs
    ./addons/bigwigs
    ./addons/tomtom
    ./addons/leatrix-plus
    ./addons/dialogue-ui
    ./addons/bartender-4
    ./addons/minimalist-chat
    ./addons/glider

    ./logs
  ];
}

{ config, pkgs, lib, ... }:

{
  imports = [
    ./addons/weakauras
    ./addons/opie
    ./addons/dominos
    ./addons/suf
    ./addons/details
    ./addons/advanced-interface-options
  ];
}

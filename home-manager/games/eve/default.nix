{ pkgs,  ... }:

{
  home.packages = with pkgs; [ pyfa ];
}

{ ... }:

let
  stable = import <nixos-stable> {};
in {
  home.packages = with stable; [ calibre ];
}

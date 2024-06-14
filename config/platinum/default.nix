{ config, pkgs, lib, ... }:


with import <nixpkgs> {};
let
  platinum = stdenv.mkDerivation rec {
    name = "platinum9";
    version = "d3d2080";
    src = fetchFromGitHub {
      owner = "grassmunk";
      repo = "Platinum9";
      rev = "master";
      hash = "sha256-rKM2/Hk1Z/HszSAO0Yf/Zh3d+QGTRJrAE/Mo90Qxgvw=";
    };

    installPhase = ''
      runHook preInstall
      install -m444 -Dt $out/share/fonts Charcoal.ttf
      runHook postInstall
    '';
  };
  in {
    home.packages = [platinum];
  }

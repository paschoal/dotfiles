{ pkgs }:
{
  project,
  file,
  hash,
  name,
  version
}:

let
  fetchCurseForge = import ../fetchcurseforge { fetchurl = pkgs.fetchurl; };
  game = "wow";
  src = fetchCurseForge { inherit name project file hash game; };
in
  pkgs.stdenv.mkDerivation {
    inherit name version src;
    buildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out
      find . -maxdepth 1 -type d -not -name 'env-vars' -exec cp -r {} $out/ \;
    '';
  }

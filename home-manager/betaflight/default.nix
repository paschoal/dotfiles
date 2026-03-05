{ pkgs, ... }:

let
  betaflight = pkgs.stdenv.mkDerivation (finalAttrs: rec {
    pname = "betaflight-configurator";
    version = "2025.12.2";

    src = pkgs.fetchFromGitHub {
      owner = "betaflight";
      repo = "betaflight-configurator";
      rev = version;
      hash = "sha256-N038yVrtC+I7gVr0EvvO1OpqbTI+w5SO1NC0RSomlJE=";
    };

    yarnOfflineCache = pkgs.fetchYarnDeps {
     yarnLock = src + "/yarn.lock";
     sha256 = "sha256-h8lp1Ms+kvjhQVFA12AilAZ3QOj3loSM0dmMGmBv1Pk=";
    };

    nativeBuildInputs = with pkgs; [
      nodejs_20
      (
        yarn.override { nodejs = nodejs_20; }
      )
      yarnConfigHook
      yarnBuildHook
      git
      makeWrapper
      copyDesktopItems
    ];

    postPatch = ''
      substituteInPlace vite.config.js \
        --replace-fail 'child.execSync("git rev-parse --short HEAD").toString().trim();' '"${version}";'
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/betaflight-configurator
      cp -r src/dist/* $out/share/betaflight-configurator

      makeWrapper "${pkgs.electron}/bin/electron" "$out/bin/betaflight-configurator" \
        --add-flags "$out/share/betaflight-configurator/index.html"

      runHook postInstall
    '';

    desktopItems = [
      (
        pkgs.makeDesktopItem rec {
          name = "betaflight-configurator";
          exec = name;
          icon = name;
          desktopName = "Betaflight Configurator";
          genericName = name;
          categories = [ "Utility" ];
          startupWMClass = name;
        }
      )
    ];
  });
in {
  home.packages = [ betaflight ];
}

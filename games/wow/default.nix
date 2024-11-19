{ config, pkgs, lib, ... }:

let
  wowAddon = import ./support/wow-addon { inherit pkgs; };
  wowPath = "drive_c/Program Files (x86)/World of Warcraft/_retail_/Interface/AddOns";
in {
  imports = [
    ./logs
  ];

  home.file = {
    ".local/share/bottles/bottles/world-of-warcraft/${wowPath}" = {
      source = pkgs.symlinkJoin {
        name = "addons";
        paths = [
          (
            wowAddon {
              version = "3.2.3";
              name = "addon-usage";
              project = "67954";
              file = "5835429";
              hash = "sha256-8AYwHHpPiXopnH7T/JQp6MeiLHYZMhkKDPgUvdDYeOI=";
            }
          )
          (
            wowAddon {
              version = "2.1.0";
              name = "advanced-interface-options";
              project = "99982";
              file = "5626351";
              hash = "sha256-7+reU7+6Iak3BiZVcLEWrXC1Lc57XV5Kc5JQZoGmRPw=";
            }
          )
          (
            wowAddon {
              version = "11.0.13";
              name = "auctionator";
              project = "6124";
              file = "5837148";
              hash = "sha256-f61F/ZRShjlzNmqbzeVBza2/GySTuzPjtukZveE9Fz4=";
            }
          )
          (
            wowAddon {
              version = "4.15.1";
              name = "bartender-4";
              project = "13501";
              file = "5754478";
              hash = "sha256-IAvdnNTqA14GEhicy7gzue33KxVGKPo38yS8semmWCc=";
            }
          )
          (
            wowAddon {
              version = "1.3.1";
              name = "better-fishing";
              project = "709520";
              file = "5844603";
              hash = "sha256-OMcFslXnuBqCCOzVygyK4AhOgIBKb1vB+U3qJa25+FY=";
            }
          )
          (
            wowAddon {
              version = "v366.1";
              name = "bigwigs";
              project = "2382";
              file = "5820495";
              hash = "sha256-yy1RLWUk5GwSwGQEvP3iBbnV1U+vCgTJ2AjCif5m2h8=";
            }
          )
          (
            wowAddon {
              version = "3.6.1";
              name = "blizzmove";
              project = "17809";
              file = "5841033";
              hash = "sha256-Sj8P6DfFVTY8Y0F0eVuLEYrjo0M/eu+VjWw2TZVyl30=";
            }
          )
          (
            wowAddon {
              version = "13090.161";
              name = "details";
              project = "61284";
              file = "5771594";
              hash = "sha256-My6NZn96CmVjAMcGhF1kvNgcsUXS7sYwrr/CfWqm4b4=";
            }
          )
          (
            wowAddon {
              version = "0.4.7";
              name = "dialogue-ui";
              project = "989270";
              file = "5833163";
              hash = "sha256-fsexUnq6BtFIZ024fvt8AbdNwWsQpsUyVB4Ez5ansZY=";
            }
          )
          (
            wowAddon {
              version = "0.2.17";
              name = "glider";
              project = "905924";
              file = "5655467";
              hash = "sha256-OYALVnlUl9rAz25b/FsrikAT0f6OMnu9bMGlW6OIGAM=";
            }
          )
          (
            wowAddon {
              version = "11.0.14";
              name = "leatrix-plus";
              project = "94855";
              file = "5836708";
              hash = "sha256-6bKHmoPLzXjr4Kp2hkVWTJ5aGRRJM980RuwilFcNzXA=";
            }
          )
          (
            wowAddon {
              version = "v11.0.44";
              name = "littlewigs";
              project = "4383";
              file = "5833879";
              hash = "sha256-/93s0TkK/IVpicD0JObBiTOZf91wf7CywMMwPKwZyfA=";
            }
          )
          (
            wowAddon {
              version = "2.1.2";
              name = "minimalist-chat";
              project = "343965";
              file = "5590929";
              hash = "sha256-1P49kTtNt5VyLitGNJDhrBypRWAg7XD5aBX2V7F4e7k=";
            }
          )
          (
            wowAddon {
              version = "1.2.17";
              name = "no-auto-close";
              project = "689952";
              file = "5776528";
              hash = "sha256-c65i8lMfxTdYBMGI5zjsFyXMBT4xK9B7JPTHhcs5MCk=";
            }
          )
          (
            wowAddon {
              version = "oerred1a";
              name = "opie";
              project = "19406";
              file = "5777633";
              hash = "sha256-otU4kxaCEAnk6kI1/39Msbs1fdKd3ATlqQiU+3XlbSM=";
            }
          )
          (
            wowAddon {
              version = "v4.4.11";
              name = "shadowed-unit-frames";
              project = "19268";
              file = "5634380";
              hash = "sha256-lPMI84YnyNrr9OBMoaKNKvihgHyJBh0QIH/Iwu+vKDA=";
            }
          )
          (
            wowAddon {
              version = "11.0.2-02";
              name = "simulationcraft";
              project = "82745";
              file = "5681282";
              hash = "sha256-FTxiCQ7x8eaW0Es+H9sF6rb4ANEOgImfb7I4qDAv3wo=";
            }
          )
          (
            wowAddon {
              version = "v4.0.3";
              name = "tomtom";
              project = "18808";
              file = "5655121";
              hash = "sha256-RTLDQ+0CDAOeiZDzyisAAtL3+ho5NwScKnZHHXLrxU0=";
            }
          )
          (
            pkgs.stdenv.mkDerivation rec {
              version = "5.17.4";
              name = "weakauras";
              src = pkgs.fetchurl {
                url = "https://github.com/WeakAuras/WeakAuras2/releases/download/${version}/WeakAuras-${version}.zip";
                hash = "sha256-zI1THFk4XjGeAXrIk/2JB2PfgwxvYMkGJNwLPaHduTM=";
              };
              nativeBuildInputs = [pkgs.unzip];
              unpackPhase = ''
                unzip $src
              '';
              installPhase = ''
                mkdir $out/
                find . -maxdepth 1 -type d -not -name 'env-vars' -exec cp -r {} $out/ \;
              '';
            }
          )
        ];
      };
    };
  };
}

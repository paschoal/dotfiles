{ config, pkgs, lib, ... }:

let
  wowAddon = import ./support/wow-addon { inherit pkgs; };
  wowPath = "drive_c/Program Files (x86)/World of Warcraft/_retail_/Interface/AddOns";
in {
  imports = [
    ./logs
  ];

  xdg.desktopEntries = {
    battlenet = {
      name = "Battle.net";
      genericName = "Battle.net";
      exec = "bottles-cli run -b world-of-warcraft-season-2 -p Battle.net";
      categories = ["Game"];
    };
  };

  home.file = {
    ".local/share/bottles/bottles/world-of-warcraft-season-2/${wowPath}" = {
      source = pkgs.symlinkJoin {
        name = "addons";
        paths = [
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
              version = "11.0.7";
              name = "auctionator";
              project = "6124";
              file = "6182618";
              hash = "sha256-Um5IhwUEcEBYciEzfXe/fD30Q9jVwEDN3XBzmXFCmAM=";
            }
          )
          (
            wowAddon {
              version = "4.15.2";
              name = "bartender-4";
              project = "13501";
              file = "6071960";
              hash = "sha256-YTImH5V13VogS027vt8RUtDvXU0V0hC8vzok0F/CRPA=";
            }
          )
          (
            wowAddon {
              version = "1.3.5";
              name = "better-fishing";
              project = "709520";
              file = "6158101";
              hash = "sha256-4Q+qF6Skt9Log+WU9LcJ2qt3wjBJiPNSz3O85Xe81Ks=";
            }
          )
          (
            wowAddon {
              version = "11.1.6";
              name = "deadly-boss-mods";
              project = "3358";
              file = "6264326";
              hash = "sha256-oumvAeeKJUEPYXFbK4gfi++OXk+8i1cSQoC/y1lHJqE=";
            }
          )
          (
            wowAddon {
              version = "r191";
              name = "dbm-dungeons-delves-events";
              project = "314994";
              file = "6264770";
              hash = "sha256-nYU1FFvUJ0BowLq25hPaUStntscdFW0z97cChEgAVBo=";
            }
          )
          (
            wowAddon {
              version = "3.6.11";
              name = "blizzmove";
              project = "17809";
              file = "6145614";
              hash = "sha256-ULNCeD53WzgDdpZ1dFkc1fbOI8RWuClS+Cylp2bzw4o=";
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
              version = "0.6.2";
              name = "dialogue-ui";
              project = "989270";
              file = "6166632";
              hash = "sha256-h9WCbrxHui1Wv/GDx1sY9RE+NpiUBOK1VzXY9XNkOFI=";
            }
          )
          (
            wowAddon {
              version = "1.0";
              name = "glider";
              project = "905924";
              file = "6114533";
              hash = "sha256-e96QYYJiCFworwqsMy47XNC6JI2OjLRVNjZuiHdZRKk=";
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
              version = "1.3.12";
              name = "no-auto-close";
              project = "689952";
              file = "6142677";
              hash = "sha256-a/IP55TZ6MgS7cIQOU2/I0Fk49swkrqOw72CsAUSO+0=";
            }
          )
          (
            wowAddon {
              version = "aand3";
              name = "opie";
              project = "19406";
              file = "6182876";
              hash = "sha256-2XiNFXmvkVOdbPa1FPzTYdnjxBoSY3sUaHrXErL1SxU=";
            }
          )
          (
            wowAddon {
              version = "v4.4.11-3-g77bd580";
              name = "shadowed-unit-frames";
              project = "19268";
              file = "5816205";
              hash = "sha256-31TrrS/ocVdlka1x7bm27HkTAwdCqoOnKMmRl0EP59Y=";
            }
          )
          #(
          #  wowAddon {
          #    version = "11.0.2-02";
          #    name = "simulationcraft";
          #    project = "82745";
          #    file = "5681282";
          #    hash = "sha256-FTxiCQ7x8eaW0Es+H9sF6rb4ANEOgImfb7I4qDAv3wo=";
          #  }
          #)
          #(
          #  wowAddon {
          #    version = "v4.0.3";
          #    name = "tomtom";
          #    project = "18808";
          #    file = "5655121";
          #    hash = "sha256-RTLDQ+0CDAOeiZDzyisAAtL3+ho5NwScKnZHHXLrxU0=";
          #  }
          #)
          (
            pkgs.stdenv.mkDerivation rec {
              version = "5.19.1";
              name = "weakauras";
              src = pkgs.fetchurl {
                url = "https://github.com/WeakAuras/WeakAuras2/releases/download/${version}/WeakAuras-${version}.zip";
                hash = "sha256-FFVqP21Sxa+Pa5EipUeq4WfdiXfPFvZ2C2DyFCWuY1k=";
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

{ config, pkgs, ... }:

{
  home.packages = [
    (
    pkgs.qutebrowser.overridePythonAttrs(
      _: {
        dependencies = with pkgs.python3Packages; [
          colorama
          pyyaml
          pyqt6-webengine
          jinja2
          tldextract
          beautifulsoup4
          pykeepass
          stem
          pynacl
          adblock
          pyperclip
          (
            pkgs.python3Packages.readability-lxml.overrideAttrs(
              _: {
                propagatedBuildInputs = [
                  pkgs.python3Packages.chardet
                  pkgs.python3Packages.cssselect
                  pkgs.python3Packages.lxml
                  (
                    pkgs.python3Packages.lxml-html-clean.overrideAttrs(
                      _: {
                        postPatch = ''
                          substituteInPlace tests/test_clean.py \
                            --replace-fail "test_host_whitelist_valid" "DISABLED_test_host_whitelist_valid" \
                            --replace-fail "test_host_whitelist_invalid" "DISABLED_test_host_whitelist_invalid" \
                            --replace-fail "test_host_whitelist_sneaky_userinfo" "DISABLED_test_host_whitelist_sneaky_userinfo"
                        '';
                      }
                    )
                  )
                ];
              }
            )
          )
        ];
      }
    )
    )
  ];

  xdg.configFile = {
    "qutebrowser/config.py" = {
      source = ./config/config.py;
    };

    "qutebrowser/dracula" = {
      source = pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "qutebrowser-dracula-theme";
        rev = "791de19";
        hash = "sha256-BXTvYFZnzEDlNEOTaWm4m8MEelVrRsUkNdwYKxaxw/g=";
      };
    };
  };
}

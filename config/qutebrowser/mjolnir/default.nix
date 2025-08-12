{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ qutebrowser ];
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

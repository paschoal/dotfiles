{ pkgs, ... }:
{
  home.packages = with pkgs; [ waybar ];
  xdg.configFile = {
    "waybar/config.jsonc" = {
      enable = true;
      text = builtins.readFile ./config.jsonc;
    };
  };

  xdg.configFile = {
    "waybar/style.css" = {
      enable = true;
      text = builtins.readFile ./style.css;
    };
  };
}

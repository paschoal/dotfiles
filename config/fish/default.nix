{ config, pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [ grc ];
    programs = {
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
          fish_config theme choose "dracula"
        '';
        functions = {
          fish_prompt = ''
            if functions -q fish_is_root_user; and fish_is_root_user
              printf '%s[%s:%s%s] %s#%s ' (set_color $fish_color_host) $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_user) (set_color normal) 
            else
              printf '%s[%s:%s%s] %s$%s ' (set_color $fish_color_host) $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_user) (set_color normal)
            end
          '';
        };
        shellAliases = {
          cat = "bat";
          feh = "feh --scale-down";
        };
        plugins = [
          { name = "grc"; src = pkgs.fishPlugins.grc.src; }
          { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
        ];
      };
    };

    xdg.configFile = {
      "fish/themes/dracula.theme" = {
        source = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/dracula/fish/refs/heads/master/themes/Dracula%20Official.theme";
          hash = "sha256-nq/+FmOpioQcspqhxdBs8jCjXLgOG1hfxcZaJsRXFxU=";
        };
      };
    };
  };
}

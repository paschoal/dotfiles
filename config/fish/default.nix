{ config, pkgs, ... }:

{
  config = {
    programs = {
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        functions = {
          fish_prompt = ''
            if functions -q fish_is_root_user; and fish_is_root_user
              printf '%s[%s] %s#%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color "red") (set_color normal) 
            else
              printf '%s[%s] %s$%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color "blue") (set_color normal)
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
  };
}

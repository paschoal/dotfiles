{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}

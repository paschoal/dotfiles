{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
      	plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
    ];
  };
}

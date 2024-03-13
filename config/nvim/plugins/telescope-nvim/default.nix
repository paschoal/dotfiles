{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim

      {
      	plugin = telescope-nvim;
	type = "lua";
	config = builtins.readFile ./config.lua;
      }
    ];
  };
}

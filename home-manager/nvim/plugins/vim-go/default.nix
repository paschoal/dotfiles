{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-go;
        type = "lua";
      }
    ];
  };
}

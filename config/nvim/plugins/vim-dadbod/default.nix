{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-dadbod;
        type = "lua";
      }

      {
        plugin = vim-dadbod-ui;
        type = "lua";
      }

      {
        plugin = vim-dadbod-completion;
        type = "lua";
      }
    ];
  };
}

{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = onedark-nvim;
        type = "lua";
        config = ''
          require("onedark").setup {
            style = "warmer",
            transparent = false,
            term_colors = true,
          }
          require("onedark").load()
        '';
      }
    ];
  };
}

{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup {
            options = {
              theme = "onedark",
              icons_enabled = false,
            },
          }
        '';
      }
    ];
  };
}

{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          require("ibl").setup()
        '';
      }
    ];
  };
}

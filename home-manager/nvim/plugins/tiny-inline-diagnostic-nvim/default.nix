{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = tiny-inline-diagnostic-nvim;
        type = "lua";
        config = ''
          vim.diagnostic.config({ virtual_text = false })
          require("tiny-inline-diagnostic").setup()
        '';
      }
    ];
  };
}

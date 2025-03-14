{ config, pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          require("lspconfig").dartls.setup {}
          require("lspconfig").lua_ls.setup {}
          -- require("lspconfig").ruby_lsp.setup {}
        '';
      }
    ];
  };
}

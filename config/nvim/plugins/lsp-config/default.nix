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
          require("lspconfig").ruby_lsp.setup {
            cmd = require("lspcontainers").command(
              "ruby_lsp", {
                image = "ruby-lsp",
                cmd = function(runtime, image)
                  return {
                    "docker",
                    "container",
                    "run",
                    "--interactive",
                    "--rm",
                    "--network=false",
                    image
                  }
                end
              }
            ),
          }
        '';
      }
      lspcontainers-nvim
    ];
  };
}

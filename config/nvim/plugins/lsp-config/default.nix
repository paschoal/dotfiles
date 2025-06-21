{
  config,
  pkgs,
  lib, 
  specialArgs,
  modulesPath,
  options,
}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      cmp-vsnip
      lspcontainers-nvim
      cmp-nvim-lsp

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local cmd_builder = function(runtime, workdir, image)
            return {
              runtime,
              "container",
              "run",
              "--interactive",
              "--rm",
              image,
            }
          end

          require("lspconfig").dartls.setup {}
          require("lspconfig").lua_ls.setup {}

          require("lspconfig").nil_ls.setup {
            capabilities = capabilities,
          }

          require("lspconfig").ruby_lsp.setup {
            capabilities = capabilities,
            single_file_support = true,
            cmd = require("lspcontainers").command("ruby_lsp", { image = "ruby_lsp", cmd_builder = cmd_builder }),
          }
        '';
      }

      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require("cmp")
          cmp.setup({
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources(
              {{ name = "nvim_lsp" }, { name = "vsnip" }},
              {{ name = "buffer" }}
            ),
          })
        '';
      }
    ];
  };
}

{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      lspcontainers-nvim
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local c = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig").nil_ls.setup { capabilities = c }
          require("lspconfig").ruby_lsp.setup { capabilities = c }
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
            window = {},
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources(
              {{ name = "nvim_lsp" }},
              {{ name = "buffer" }}
            ),
          })
        '';
      }
    ];
  };
}

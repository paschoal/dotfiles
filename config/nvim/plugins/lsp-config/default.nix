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
          vim.lsp.config("nil_ls", { capabilities = c })
        '';
      }

      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require("cmp")
          cmp.setup({
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

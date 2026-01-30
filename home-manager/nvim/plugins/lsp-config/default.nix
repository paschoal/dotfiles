{ pkgs, ... }:
{
  #
  # language servers
  #
  home.packages = with pkgs; [
    nil # nix
    marksman # markdown
    gopls # golang
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      lspcontainers-nvim
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local s = {
            { "marksman" },
            { "nil_ls" },
            { "gopls" },
          }

          for _, lsp in pairs(s) do
            local name, config = lsp[1], lsp[2]
            vim.lsp.enable(name)
            if config then
              vim.lsp.config(name, config)
            end
          end
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

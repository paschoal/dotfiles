require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlightning = false,
  },
  indent = { enable = true },
  matchup = { enable = true },
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99

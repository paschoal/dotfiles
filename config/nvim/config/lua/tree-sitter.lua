require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
  matchup = { enable = true },
}

-- Ruby indentation is broken
-- using tree-sitter due the .end statement.
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')

local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2

opt.autoindent = true
opt.cindent = false
opt.smartindent = true

opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#C678DD gui=nocombine]]

require('ibl').setup()

-- Ruby indentation is broken
-- using tree-sitter due the .end statement.
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')

local opt = vim.opt

opt.updatetime = 250
opt.hlsearch = false
opt.incsearch = true
opt.number = true
opt.ruler = false
opt.wrap = false
opt.cursorline = false
opt.eol = true
opt.wrapscan = false
opt.errorbells = false
opt.visualbell = false

opt.list = true
opt.listchars:append 'tab:··'
opt.listchars:append 'eol:¬'
opt.listchars:append 'trail:-'
opt.listchars:append 'extends:>'
opt.listchars:append 'precedes:<'

opt.clipboard = "unnamedplus"

vim.g.mapleader = ","

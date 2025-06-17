require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlightning = false,
  },
  indent = { enable = true },
  matchup = { enable = true },
  incremental_selection = {
    enable = true,
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
  },
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99
vim.keymap.set("n", "<space>", "za", { noremap = true, silent = true })

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",

    ["dockerfile.ya?ml"] = "dockerfile",
  },
})

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "ruby",
    callback = function()
      vim.opt_local.indentkeys:remove(".")
    end,
  }
)

require("telescope").setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })

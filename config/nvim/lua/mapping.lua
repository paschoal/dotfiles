local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true, nowait = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<space>', 'za')
map(
  'n',
  '<leader>ff',
  require('telescope.builtin').find_files,
  {
    desc = 'telescope: [f]ind [f]files',
    buffer = bufnr,
  }
)
map(
  'n',
  '<leader>fb',
  require('telescope.builtin').buffers,
  {
    desc = 'telescope: [f]ind [b]uffers',
    buffer = bufnr,
  }
)

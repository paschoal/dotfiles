require('onedark').setup {
  style = 'warmer',
  transparent = true,
  term_colors = true,
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none',
  },
  lualine = {
    transparent = true,
  },
}
require('onedark').load()

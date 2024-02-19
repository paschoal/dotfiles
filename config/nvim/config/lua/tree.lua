require('neo-tree').setup {
  close_if_last_window = false,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = false,
  sort_case_insensitive = false,
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },

    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = '|',
      last_indent_marker = '|',
      highlight = 'NeoTreeIndentMarker',
    },

    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      default = '',
      highlight = 'NeoTreeFileIcon'
    },

    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeFileIcon',
    },

    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },

    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },

    file_size = { enabled = false },
    created = { enabled = false },
    symlink_target = { enabled = false },

    type = {
      enabled = true,
      required_width = 64,
    },

    last_modified = {
      enabled = true,
      required_width = 88,
    },

  },

  window = {
    width = 40,
    position = 'current',
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ['<space>'] = { 'toggle_node', nowait = false },
      ['q'] = 'close_window',
      ['a'] = 'add',
      ['d'] = 'delete',
      ['m'] = 'rename',
      ['A'] = 'add_directory',
      ['r'] = 'refresh',
      ['i'] = 'open_vsplit',
      ['s'] = 'open_split',
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        'node_modules',
      },
      never_show = {},
    },
    follow_current_file = {
      enabled = true,
    },
    hijack_netrw_behavior = 'open_default',
  },
}

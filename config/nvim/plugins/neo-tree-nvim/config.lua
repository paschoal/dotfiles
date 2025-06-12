require("neo-tree").setup {
  add_blank_line_at_top = false,
  auto_clean_after_session_restore = false,
  close_if_last_window = false,

  enable_diagnostics = false,
  enable_modified_markers = true,
  enable_opened_markers = true,
  enable_refresh_on_write = true,
  enable_git_status = true,

  hide_root_node = false,
  retain_hidden_root_indent = false,
  log_level = "info",
  log_to_file = false,
  popup_border_style = "rounded",
  sort_case_insensitive = false,

  default_component_configs = {
    container = {
      enable_character_fade = true,
    },

    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "|",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      with_expanders = nil,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },

    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰉖",
      folder_empty_open = "󰷏",
      default = "",
      highlight = "NeoTreeFileIcon"
    },

    modified = {
      symbol = "[+] ",
      highlight = "NeoTreeFileIcon",
    },

    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },

    git_status = {
      symbols = {
        added     = "✚",
        deleted   = "✖",
        modified  = "",
        renamed   = "󰁕",
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      },
      align = "right",
    },

    file_size = {
      enabled = false,
    },

    created = {
      enabled = false,
    },

    symlink_target = {
      enabled = false,
    },

    type = {
      enabled = true,
      required_width = 64,
    },

    last_modified = {
      enabled = true,
      required_width = 88,
    },
  },

  renderers = {
    directory = {
      { "indent" },
      { "icon" },
      { "name" },
    },
    file = {
      { "indent" },
      { "name" },
    },
  },

  window = {
    width = 40,
    position = "left",
    mapping_options = {
      noremap = true,
      nowait = true,
    },

    mappings = {
      ["<space>"] = { "toggle_node", nowait = false },
      ["q"] = "close_window",
      ["a"] = "add",
      ["d"] = "delete",
      ["m"] = "rename",
      ["A"] = "add_directory",
      ["r"] = "refresh",
      ["i"] = "open_vsplit",
      ["s"] = "open_split",
      ["t"] = "open_tabnew",
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
      },
      never_show = {},
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = "open_default",
  },
}

vim.keymap.set("n", "<leader>/", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

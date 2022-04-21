local global_icons = require("global.icons").icons

vim.g.nvim_tree_git_hl = 1

require'nvim-tree'.setup {
  hide_root_folder = true,
  hijack_cursor = true,
  renderer = {
    indent_markers = {
      enable = true,
    }
  },
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = global_icons.hint,
      info = global_icons.info,
      warning = global_icons.warning,
      error = global_icons.error,
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      }
    }
  }
}

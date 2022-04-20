vim.g.nvim_tree_git_hl = 1

require'nvim-tree'.setup {
  open_on_setup_file = true,
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
      error = " ",
      warning = " ",
      hint = " ",
      info = " "
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

local global_icons = require("core.ui-globals").icons
local nvim_tree = require("nvim-tree")
local which_key = require("which-key")

nvim_tree.setup {
  hijack_cursor = true,
  remove_keymaps = { "H", "J", "K", "L" }, -- conflicts with window resize
  renderer = {
    full_name = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        folder_arrow = false,
      },
    }
  },
  git = {
      enable = true,
      ignore = false,
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
}

which_key.register({
  ["<leader>"] = {
    e = {
      name = "Explorer",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorere" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus File Explorere" },
      r = { "<cmd>NvimTreeRefresh<cr>", "Refersh File Explorere" },
      m = { "<cmd>NvimTreeFindFile<cr>", "Move to Current Buffer" },
      h = { "<cmd>vert help nvim-tree<cr>", "Open Documentation" },
    }
  }
})

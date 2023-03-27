-- diable netrw plugin for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")
nvim_tree.setup {
  hijack_cursor = true,
  view = {
    width = {}, -- make window resize automatically 
  },
  renderer = {
    icons = {
      show = {
        folder_arrow = false,
      },
    }
  },
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  }
}

local which_key = require("which-key")
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

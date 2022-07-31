require('telescope').setup{
  defaults = {
    path_display = { "truncate" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    }
  }
})

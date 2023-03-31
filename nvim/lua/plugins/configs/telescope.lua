require('telescope').setup {
  defaults = {
    border = true,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}

require("catppuccin.lib.highlighter").syntax({
  TelescopeNormal = { link = "NormalFloat"},
  TelescopeBorder = { link = "FloatBorder"},
})

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    }
  }
})

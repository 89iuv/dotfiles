require('telescope').setup {
  defaults = {
    path_display = { "truncate" },
    -- border = false,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}


local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  TelescopePromptNormal = { bg = colors.mantle },
  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopePreviewNormal = { bg = colors.mantle },
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

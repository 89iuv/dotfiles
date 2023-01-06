require('telescope').setup{
  defaults = {
    path_display = { "truncate" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}

local colors = require("catppuccin.palettes").get_palette "mocha"
require("catppuccin.lib.highlighter").syntax({
  TelescopePromptNormal = { bg = colors.mantle },
  TelescopePromptBorder = { fg = colors.surface0, bg = colors.mantle },
  TelescopePromptTitle = { fg = colors.text, bg = colors.mantle },

  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopeResultsBorder = { fg = colors.surface0, bg = colors.mantle },
  TelescopeResultsTitle = { fg = colors.text, bg = colors.mantle },

  TelescopePreviewNormal = { bg = colors.mantle },
  TelescopePreviewBorder = { fg = colors.surface0, bg = colors.mantle },
  TelescopePreviewTitle = { fg = colors.text, bg = colors.mantle },
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

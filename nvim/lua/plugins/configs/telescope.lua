require('telescope').setup {
  defaults = {
    path_display = { "truncate" },
    -- border = false,
    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}


local base1 = "#2D3145"
local base2 = "#32364A"
local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  TelescopePromptNormal = { fg = colors.text, bg = base1 },
  TelescopePromptBorder = { fg = base1, bg = base1 },
  TelescopePromptTitle = { fg = colors.subtext1, bg = base1 },

  TelescopeResultsNormal = { fg = colors.subtext1, bg = base1 },
  TelescopeResultsBorder = { fg = base1, bg = base1 },
  TelescopeResultsTitle = { fg = base1, bg = base1 },

  TelescopePreviewNormal = { bg = base2 },
  TelescopePreviewBorder = { fg = base2, bg = base2 },
  TelescopePreviewTitle = { fg = base2, bg = base2 },

  -- TelescopeMultiSelection = { fg = colors.text, bg = colors.surface1, style = { "bold" }  },
  -- TelescopeSelection = { fg = colors.text, bg = colors.surface1, style = { "bold" } },

  -- TelescopePromptNormal = { bg = colors.mantle },
  -- TelescopeResultsNormal = { bg = colors.mantle },
  -- TelescopePreviewNormal = { bg = colors.mantle },
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

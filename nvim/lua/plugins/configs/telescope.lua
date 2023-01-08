require('telescope').setup{
  defaults = {
    path_display = { "truncate" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  -- TelescopePromptNormal = { fg = colors.text, bg = colors.surface0 },
  -- TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
  -- TelescopePromptTitle = { fg = colors.subtext1, bg = colors.surface0 },
  --
  -- TelescopeResultsNormal = { fg = colors.subtext0, bg = colors.surface0 },
  -- TelescopeResultsBorder = { fg = colors.surface0, bg = colors.surface0 },
  -- TelescopeResultsTitle = { fg = colors.surface0, bg = colors.surface0 },
  --
  -- TelescopePreviewNormal = { bg = colors.surface0 },
  -- TelescopePreviewBorder = { fg = colors.surface0, bg = colors.surface0 },
  -- TelescopePreviewTitle = { fg = colors.surface0, bg = colors.surface0 },
  --
  -- TelescopeMultiSelection = { fg = colors.text, bg = colors.surface1, style = { "bold" }  },
  -- TelescopeSelection = { fg = colors.text, bg = colors.surface1, style = { "bold" } },

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

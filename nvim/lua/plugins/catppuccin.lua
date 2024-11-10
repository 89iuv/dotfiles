return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        -- nvim
        NormalFloat = { fg = colors.text, bg = colors.mantle },
        FloatBorder = { fg = colors.lavender, bg = colors.mantle },
        FloatTitle = { link = "FloatBorder" }, -- fix for which_key window title

        WinSeparator = { fg = colors.crust, bg = colors.base },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },

        -- mini
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- telescope
        TelescopeNormal = { link = "NormalFloat" },

        -- trouble
        TroubleNormal = { link = "Normal" },
        TroubleNormalNc = { link = "TroubleNormal" },

        -- snacks
        SnacksNormal = { link = "NormalFloat" },
        SnacksNormalNC = { link = "SnacksNormal" },
        SnacksWinBar = { fg = colors.overlay1 },
        SnacksWinBarNC = { fg = colors.surface1 },
      }
    end,
  },
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        -- nvim
        NormalFloat = { fg = colors.text, bg = colors.mantle },
        FloatBorder = { fg = colors.lavender, bg = colors.base },
        FloatTitle = { link = "FloatBorder" },

        WinSeparator = { fg = colors.crust, bg = colors.base },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },

        -- mini
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- trouble
        TroubleNormal = { link = "Normal" },
        TroubleNormalNc = { link = "Normal" },
      }
    end,
  },
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        -- nvim
        FloatBorder = { fg = colors.lavender },

        -- neotree
        NeoTreeWinSeparator = { fg = colors.mantle },

        -- telescope
        TelescopeNormal = { link = "NormalFloat" },

        -- mini
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- trouble
        TroubleNormal = { link = "Normal" },
        TroubleNormalNc = { link = "Normal" },
      }
    end,
  },
}

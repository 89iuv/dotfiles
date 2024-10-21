return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        FloatBorder = { fg = colors.lavender },
        TelescopeNormal = { link = "NormalFloat" },
        MiniIndentscopeSymbol = { fg = colors.surface2 },
      }
    end,
  },
}

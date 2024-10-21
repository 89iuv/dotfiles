return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        FloatBorder = { fg = colors.lavender },
        TelescopeNormal = { link = "NormalFloat" },
      }
    end,
  },
}

return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    auto_preview = false,
    modes = {
      lsp = {
        auto_refresh = false,
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.5,
        },
        win = {
          position = "bottom",
          size = 0.30,
        },
      },
      symbols = {
        focus = true,
        win = {
          size = 40,
        },
        format = "{kind_icon} {symbol.name}",
      },
    },
  },
}

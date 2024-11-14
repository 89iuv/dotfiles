return {
  "folke/trouble.nvim",
  enabled = true,
  opts = {
    modes = {
      lsp = {
        win = {
          position = "bottom",
          size = 20,
        },
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 80,
        },
      },
      symbols = {
        win = {
          position = "left",
          size = 40,
        },
      },
    },
    auto_preview = true,
    auto_refresh = false,
    focus = true,
    open_no_results = true,
  },
}

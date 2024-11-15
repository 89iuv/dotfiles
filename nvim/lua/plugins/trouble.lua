return {
  "folke/trouble.nvim",
  enabled = true,
  opts = {
    modes = {
      lsp = {
        auto_preview = false,
        auto_refresh = false,
        focus = true,
        open_no_results = true,
        win = {
          position = "bottom",
          size = 20,
        },
      },
      symbols = {
        auto_preview = true,
        auto_refresh = true,
        focus = true,
        open_no_results = true,
        win = {
          position = "right",
          size = 45,
        },
      },
    },
    keys = {
      ["<esc>"] = "close",
    },
  },
}

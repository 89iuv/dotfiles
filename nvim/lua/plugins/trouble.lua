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
      },
      symbols = {
        win = {
          position = "right",
          size = 45,
        },
      },
    },
    auto_preview = false,
    auto_refresh = false,
    focus = true,
    open_no_results = true,
  },
}

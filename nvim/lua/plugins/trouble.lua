return {
  "folke/trouble.nvim",
  enabled = true,
  opts = {
    auto_preview = false,
    auto_refresh = false,
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
  },
}

return {
  "folke/noice.nvim",
  -- enabled = false,
  opts = {
    presets = {
      bottom_search = false,
      command_palette = true,
      lsp_doc_border = true,
    },
    views = {
      split = {
        scrollbar = false,
        close = {
          keys = { "<esc>", "q" },
        },
      },
      popup = {
        close = {
          keys = { "<esc>", "q" },
        },
      },
    },
  },
}

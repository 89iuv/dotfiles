return {
  "folke/noice.nvim",
  -- enabled = false,
  opts = {
    presets = {
      bottom_search = false,
      command_palette = true,
      lsp_doc_border = true,
    },
    lsp = {
      progress = {
        enabled = false,
      },
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
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        opts = { skip = true },
        view = "notify",
      },
    },
  },
}

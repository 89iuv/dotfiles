return {
  "folke/noice.nvim",
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
    commands = {
      history = {
        view = "vsplit",
      },
      all = {
        view = "vsplit",
      },
    },
    views = {
      split = {
        scrollbar = false,
        size = "40%",
      },
    },
    routes = {
      -- enable notification for saving a file
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
        opts = { skip = false },
        view = "notify",
      },
    },
  },
}

return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = {
        views = {
          cmdline_popupmenu = {
            border = {
              style = vim.g.border,
            },
          },
        },
      },
      bottom_search = false,
      lsp_doc_border = {
        views = {
          hover = {
            border = {
              style = vim.g.border,
            },
          },
        },
      },
    },
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
    views = {
      popup = {
        border = {
          style = vim.g.border,
        },
      },
      cmdline_popup = {
        border = {
          style = vim.g.border,
        },
      },
      cmdline_input = {
        border = {
          style = vim.g.border,
        },
      },
      confirm = {
        border = {
          style = vim.g.border,
        },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
  },
}

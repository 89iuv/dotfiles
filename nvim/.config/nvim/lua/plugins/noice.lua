return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = {
        views = {
          cmdline_popupmenu = {
            border = {
              style = vim.o.winborder,
            },
          },
        },
      },
      bottom_search = false,
      lsp_doc_border = {
        views = {
          hover = {
            border = {
              style = vim.o.winborder,
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
          style = vim.o.winborder,
        },
      },
      cmdline_popup = {
        border = {
          style = vim.o.winborder,
        },
      },
      cmdline_input = {
        border = {
          style = vim.o.winborder,
        },
      },
      confirm = {
        border = {
          style = vim.o.winborder,
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

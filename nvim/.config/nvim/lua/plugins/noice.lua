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
      progress = {
        format = {
          {
            "{progress} ",
            key = "progress.percentage",
            contents = {
              { "{data.progress.message} " },
            },
          },
          { "({data.progress.percentage}%) ", hl_group = "NoiceLspProgressTitle" },
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
        format_done = {
          { " ✓ ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
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
      mini = {
        size = {
          max_height = 4,
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

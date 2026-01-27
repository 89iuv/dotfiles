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
      override = {
        -- override the default lsp markdown formatter with Noice
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        -- override the lsp markdown formatter with Noice
        ["vim.lsp.util.stylize_markdown"] = false,
        -- override cmp documentation with Noice (needs the other options to work)
        ["cmp.entry.get_documentation"] = false,
      },
      signature = {
        enabled = false,
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

return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = {
        views = {
          cmdline_popupmenu = {
            border = {
              style = "single",
            },
            win_options = {
              winblend = 0,
              winhighlight = { Normal = "NoiceCmdlinePopup", FloatBorder = "NoiceCmdlinePopupBorder" },
            },
          },
        },
      },
      bottom_search = false,
      lsp_doc_border = {
        views = {
          hover = {
            border = {
              style = "single",
            },
          },
        },
      },
    },
    lsp = {
      progress = {
        enabled = false,
      },
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
    views = {
      popup = {
        border = {
          style = "single",
        },
      },
      cmdline_popup = {
        border = {
          style = "single",
        },
      },
      cmdline_input = {
        border = {
          style = "single",
        },
      },
      cmdline_popupmenu = {
        view = "mini",
      },
      confirm = {
        border = {
          style = "single",
        },
      },
    },
  },
}

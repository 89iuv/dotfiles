return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = {
        views = {
          cmdline_popupmenu = {
            border = {
              style = require("config.global").border,
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
              style = require("config.global").border,
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
          style = require("config.global").border,
        },
      },
      cmdline_popup = {
        border = {
          style = require("config.global").border,
        },
      },
      cmdline_input = {
        border = {
          style = require("config.global").border,
        },
      },
      cmdline_popupmenu = {
        view = "mini",
      },
      confirm = {
        border = {
          style = require("config.global").border,
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

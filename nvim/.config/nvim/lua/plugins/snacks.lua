return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
    statuscolumn = {
      enabled = true,
    },
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        command_history = {
          layout = {
            preset = "select",
          },
        },
      },
      previewers = {
        git = {
          builtin = false,
          args = {
            "-c",
            "delta.file-style=omit",
            "-c",
            "delta.hunk-header-style=omit",
          },
        },
        diff = {
          builtin = false,
          cmd = { "delta", "--file-style=omit", "--hunk-header-style=omit" },
        },
      },
      win = {
        input = {
          keys = {
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["J"] = { "preview_scroll_down", mode = { "n" } },
          },
        },
      },
    },
    words = {
      debounce = 80, -- time in ms to wait before updating
      modes = { "n" }, -- modes to show references
    },
    notifier = {
      width = { min = 0.35, max = 0.35 },
      height = { min = 1, max = 0.6 },
      style = "fancy",
      margin = { top = 0, right = 0, bottom = 0 },
      top_down = true,
    },
    terminal = {
      win = {
        height = 0.30,
        wo = {
          winbar = "",
          winhighlight = "Normal:Normal",
        },
        keys = {
          term_normal = {
            "<esc><esc>",
            function()
              return "<C-\\><C-n>"
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      },
    },
    lazygit = {
      configure = false,
      win = {
        height = 0.9,
      },
    },
    styles = {
      news = {
        border = "single",
      },
      notification = {
        wo = {
          winblend = 0,
          wrap = true,
        },
      },
    },
    win = {
      backdrop = 60,
    },
  },
}

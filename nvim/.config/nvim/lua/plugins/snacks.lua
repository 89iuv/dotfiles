local neovim_header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    if not vim.g.image_support then
      require("snacks.image").supports_file = function()
        return vim.g.image_support
      end
    end
    local new_opts = {
      animate = {
        fps = vim.g.animate_fps,
      },
      scroll = {
        enabled = false,
      },
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = neovim_header,
        },
      },
      image = {
        enabled = vim.g.image_support,
      },
      input = {
        enabled = true,
      },
      picker = {
        layout = {
          cycle = true,
        },
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
            args = {
              "-c",
              "delta.file-style=omit",
              "-c",
              "delta.hunk-header-style=omit",
            },
          },
          diff = {
            style = "terminal",
            cmd = {
              "delta",
              "--file-style=omit",
              "--hunk-header-style=omit",
            },
          },
        },
      },
      indent = {
        enabled = false,
        scope = {
          enabled = false,
        },
      },
      notifier = {
        width = { min = 50, max = 50 },
        height = { min = 1, max = 0.6 },
        style = "fancy",
        margin = { top = 0, right = 0, bottom = 0 },
        top_down = true,
        refresh = 80,
        wo = {
          winblend = vim.o.winblend,
        },
      },
      terminal = {
        win = {
          height = 0.30,
          wo = {
            winhighlight = "Normal:SnacksTerminal,WinBar:SnacksWinBar",
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
          border = vim.g.border,
        },
        notification = {
          wo = {
            winblend = vim.o.winblend,
            wrap = true,
          },
        },
        input = {
          width = 30,
          relative = "cursor",
          row = -3,
          col = 0,
        },
      },
      win = {
        backdrop = 60,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

return {
  "folke/snacks.nvim",
  opts = {
    statuscolumn = {
      enabled = true,
    },
    lazygit = {
      configure = false,
      win = {
        height = 0.9,
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
        },
      },
    },
    notifier = {
      level = vim.log.levels.INFO,
      width = { min = 0.35, max = 0.35 },
      height = { min = 1, max = 0.6 },
      style = "fancy",
      margin = { top = 0, right = 0, bottom = 0 },
      top_down = true,
    },
    terminal = {
      win = {
        height = 15,
        wo = {
          winbar = "",
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
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
    styles = {
      notification = {
        wo = {
          winblend = 0,
          wrap = false,
        },
      },
    },
  },
}

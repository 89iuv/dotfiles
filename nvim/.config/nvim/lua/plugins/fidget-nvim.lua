return {
  "j-hui/fidget.nvim",
  version = "1.6.1",
  lazy = true,
  event = "BufEnter",
  opts = {
    progress = {
      display = {
        done_icon = "✓ ",
        progress_icon = {
          pattern = {
            "⠋ ",
            "⠙ ",
            "⠹ ",
            "⠸ ",
            "⠼ ",
            "⠴ ",
            "⠦ ",
            "⠧ ",
            "⠇ ",
            "⠏ ",
          },
        },
        format_message = function(msg)
          local message = require("fidget.progress.display").default_format_message(msg)
          return " " .. message
        end,
        -- How to format a progress annotation
        format_annote = function(msg)
          return  msg.title and msg.title .. " " or " "
        end,
      },
    },
    notification = {
      view = {
        render_message = function(msg, cnt)
          return cnt == 1 and msg or string.format(" (%dx)%s", cnt, msg)
        end,
      },
      window = {
        border = "none",
        -- border = { "", "" ,"", " ", "", "", "", " " },
        normal_hl = "FidgetNormal",
        border_hl = "FidgetBorder",
        winblend = vim.o.winblend,
        x_padding = 0,
      },
    },
  },
}

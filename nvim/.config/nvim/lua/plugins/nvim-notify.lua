return {
  "rcarriga/nvim-notify",
  enabled = true,
  lazy = true,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("notify").setup({
      background_colour = "NotifyBackground",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
      },
      timeout = 5000,
      top_down = true,
    })

    local notify = require("notify")

    vim.notify = function(msg, level, opts)
      if opts and opts.title == "Trouble" then
        opts.replace = nil
      end
      return notify(msg, level, opts)
    end
  end,
}

return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "copilot-chat" },
  opts = {
    debounce = 160,
    on = {
      render = function()
        pcall(function()
          require("virt-column").setup_buffer(0, {
            enabled = false
          })
        end)
      end,
      clear = function()
        pcall(function()
          require("virt-column").setup_buffer(0, {
            enabled = vim.g.virt_column
          })
        end)
      end,
    },
    completions = {
      lsp = {
        enabled = true,
      },
      blink = {
        enabled = true,
      },
    },
    anti_conceal = {
      enabled = true,
      ignore = {
        link = false,
      },
    },
    latex = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
    },
    code = {
      width = "full",
      border = "thin",
      disable_background = {},
    },
    heading = {
      position = "inline",
      icons = {
        "█ ",
        "██ ",
        "███ ",
        "████ ",
        "█████ ",
        "██████ ",
      },
    },
    pipe_table = {
      style = "normal",
      border = {
        " ",
        " ",
        " ",
        "─",
        "─",
        "─",
        " ",
        " ",
        " ",
        " ",
        "─",
      },
    },
    html = {
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = false,
      },
    },
    win_options = {
      conceallevel = {
        default = 0,
        rendered = 2,
      },
    },
  },
}

return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "copilot-chat" },
  opts = {
    debounce = 160,
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
        code_background = false,
      },
    },
    latex = {
      enabled = true,
    },
    link = {
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
        default = 0, -- show everything (including links) when not in rendered mode
        rendered = 3,
      },
    },
  },
}

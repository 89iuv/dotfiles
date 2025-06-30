return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = {"markdown", "copilot-chat"},
  opts = {
    debounce = 80,
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
        rendered = 0,
      },
    },
  },
}

return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    debounce = 80,
    anti_conceal = {
      enabled = true,
      ignore = {
        link = false,
      }
    },
    latex = {
      enabled = false,
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
  },
}

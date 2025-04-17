return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    latex = {
      enabled = false
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
    -- this will render all characters when entering insert mode
    win_options = {
      conceallevel = {
        default = 0,
      },
    },
  },
}

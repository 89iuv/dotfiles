return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "norg", "rmd", "org", "copilot-chat" },
  opts = {
    render_modes = true,
    code = {
      width = "full",
    },
    heading = {
      position = "inline",
      icons = {
        "█ 󰎦 ",
        "██ 󰎩 ",
        "███ 󰎬 ",
        "████ 󰎮 ",
        "█████ 󰎰 ",
        "██████ 󰎵 ",
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
    file_types = { "markdown", "copilot-chat" },
    -- this will render all characters when entering insert mode
    win_options = {
      conceallevel = {
        default = 0,
      },
    },
  },
}

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
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    file_types = { "markdown", "copilot-chat" },
  },
}

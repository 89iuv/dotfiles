return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "copilot-chat" },
  opts = {
    debounce = 160,
    completions = {
      lsp = {
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
      enabled = false,
    },
    link = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
    },
    code = {
      sign = false,
      language_icon = true,
      width = "full",
      border = "thin",
      disable_background = {},
    },
    heading = {
      sign = false,
      signs = {
        "󰉫 ",
        "󰉬 ",
        "󰉭 ",
        "󰉮 ",
        "󰉯 ",
        "󰉰 ",
      },
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

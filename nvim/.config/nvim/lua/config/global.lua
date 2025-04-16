local M = {}

M.indent_guide = {
  exclude = {
    filetype = {
      -- default
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "gitcommit",
      "TelescopePrompt",
      "TelescopeResults",
      "",

      -- lazy
      "Trouble",
      "alpha",
      "dashboard",
      "fzf",
      "help",
      "lazy",
      "mason",
      "neo-tree",
      "notify",
      "snacks_dashboard",
      "snacks_notif",
      "snacks_terminal",
      "snacks_win",
      "toggleterm",
      "trouble",

      -- custom
      "markdown",
      "snacks_picker_preview",
      "snacks_picker_list",
      "neo-tree-popup",
    },

    buftype = {
      -- default
      "terminal",
      "quickfix",
      "prompt",
    },
  },
}

return M

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "debugpy", -- used by python dap
      "lemminx",
      -- "ltex-ls-plus"
      "harper-ls",
    },
    ui = {
      backdrop = 60,
      border = require("config.global").border,
      width = 0.8,
      height = 0.8,
    },
  },
}

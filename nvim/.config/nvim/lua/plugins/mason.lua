return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "debugpy", -- used by lazyvim for language python
      "lemminx",
    },
    ui = {
      backdrop = 60,
      border = vim.g.border,
      width = 0.8,
      height = 0.8,
    },
  },
}

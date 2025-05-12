return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "debugpy", -- used by python dap
      "lemminx",
    },
    ui = {
      backdrop = 60,
      border = "single",
      width = 0.8,
      height = 0.8,
    },
  },
}

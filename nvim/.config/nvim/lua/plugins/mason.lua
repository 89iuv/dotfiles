return {
  "williamboman/mason.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      "lemminx",
      "tree-sitter-cli",
    },
    ui = {
      backdrop = 60,
      border = "single",
      width = 0.8,
      height = 0.8,
    },
  },
}

return {
  "williamboman/mason.nvim",
  opts = {
    -- add maven bin folder to the end of the path
    PATH = "append",
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "shellcheck",
      "lemminx",
      "ltex-ls",
    },
  },
}

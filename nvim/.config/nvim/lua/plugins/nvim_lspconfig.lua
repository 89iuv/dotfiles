return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    -- load icons from global config
    local icons = require("config.global").icons

    --lsp diagnostics configuration
    vim.diagnostic.config({
      severity_sort = true,
      float = {
        source = true,
        border = vim.g.border,
      },
      virtual_text = {
        source = true,
        prefix = "■",
        severity = {
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.ERROR,
        },
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
          [vim.diagnostic.severity.WARN]  = icons.diagnostics.warn,
          [vim.diagnostic.severity.INFO]  = icons.diagnostics.info,
          [vim.diagnostic.severity.HINT]  = icons.diagnostics.hint,
        },
      },
    })

    -- lsp server configuration
    vim.lsp.enable("lua_ls")
  end
}

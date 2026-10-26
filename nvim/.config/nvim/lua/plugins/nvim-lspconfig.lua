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
        border = "single",
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
          [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
        },
      },
    })

    -- keymaps
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        max_width = 80,
        max_height = 20,
        border = "single",
      })
    end, { desc = "LSP Hover Documentation" })

    -- lua
    vim.lsp.enable("lua_ls")

    -- python
    vim.lsp.config("pyright", {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { "*" },
          },
        },
      },
    })
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
  end,
}

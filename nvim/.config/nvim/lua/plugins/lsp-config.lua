return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local new_opts = {
      diagnostics = {
        virtual_text = {
          source = true,
        },
        severity_sort = true,
        float = {
          source = true,
        },
      },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
      servers = {
        pyright = {
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
        },
      },
    }

    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

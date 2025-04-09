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
        -- pyright = {
        --   settings = {
        --     pyright = {
        --       -- Using Ruff's import organizer
        --       disableOrganizeImports = true,
        --     },
        --     python = {
        --       analysis = {
        --         -- Ignore all files for analysis to exclusively use Ruff for linting
        --         ignore = { "*" },
        --       },
        --     },
        --   },
        -- },
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

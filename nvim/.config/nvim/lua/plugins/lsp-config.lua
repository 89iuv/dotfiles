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
        ruff = {
          init_options = {
            settings = {
              lineLength = 119,
              configurationPreference = "filesystemFirst",
              lint = {
                select = {
                  "E", -- pycodestyle
                  "F", -- Pyflakes
                  "UP", -- pyupgrade
                  "B", -- flake8-bugbear
                  "SIM", -- flake8-simplify
                  "I", -- isort
                },
                ignore = {
                  -- covered by pyright
                  "F401", -- unused-import
                  "F821", -- undefined-name
                  "F841", -- unused-variable
                  "B018", -- useless-expression
                  -- disabled rules
                  "E501", -- line-to-long
                },
              },
            },
          },
        },
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

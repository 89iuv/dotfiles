return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local new_opts = {
      diagnostics = {
        float = {
          source = true,
          border = vim.g.border,
        },
        virtual_text = {
          source = true,
          prefix = "■",
        },
        severity_sort = true,
      },
      servers = {
        ["*"] = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lineLength = 120,
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

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

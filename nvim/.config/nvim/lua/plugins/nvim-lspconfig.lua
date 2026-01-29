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
          severity = {
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
          },
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
        -- fix for lua_ls server not loading
        -- https://github.com/folke/lazydev.nvim/issues/136#issuecomment-3796597122
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = {
                  vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              openFilesOnly = false,
              disableOrganizeImports = true,
              analysis = {
                typeCheckingMode = "standard",
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
        taplo = {
          root_markers = { ".taplo.toml", "taplo.toml", ".git", ".root" },
        },
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

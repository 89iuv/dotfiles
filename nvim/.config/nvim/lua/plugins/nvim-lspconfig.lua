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
        -- HACK: for lua_ls server not loading
        -- https://github.com/folke/lazydev.nvim/issues/136#issuecomment-3796597122
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = {
                  vim.env.VIMRUNTIME
                },
              },
              hint = {
                paramName = "All",
              },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "standard",
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              configurationPreference = "filesystemFirst",
            },
          },
        },
        taplo = {
          root_markers = { ".taplo.toml", "taplo.toml", ".git", ".root" },
        },
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
                OrthographicConsistency = false,
                SpellCheck = false,
              },
              codeActions = {
                ForceStable = false,
              },
            },
          },
        },
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

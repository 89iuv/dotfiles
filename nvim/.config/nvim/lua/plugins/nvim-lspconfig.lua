return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }

    local new_opts = {
      diagnostics = {
        float = {
          source = true,
          border = require("config.global").border,
        },
        virtual_text = {
          source = true,
          prefix = "■",
        },
        severity_sort = true,
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
                  -- disabled rules
                  "E501", -- line-to-long
                },
              },
            },
          },
        },
        harper_ls = {
          filetypes = { "markdown" },
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
                SpellCheck = true,
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

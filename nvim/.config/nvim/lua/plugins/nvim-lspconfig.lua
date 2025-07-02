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
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
                SpellCheck = true,
              },
              codeActions = {
                ForceStable = true,
              },
            },
          },
        },
        -- ltex_plus = {
        --   filetypes = { "markdown" },
        --   settings = {
        --     ltex = {
        --       enabled = true,
        --       language = "en-US",
        --     },
        --   },
        -- },
      },
      setup = {
        -- ltex_plus = function(_, ltex_plus_opts)
        --   ltex_plus_opts.on_attach = function(_, bufnr)
        --     for _, win in ipairs(vim.api.nvim_list_wins()) do
        --       if vim.api.nvim_win_get_buf(win) == bufnr then
        --         vim.wo[win].spell = false
        --       end
        --     end
        --   end
        -- end,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

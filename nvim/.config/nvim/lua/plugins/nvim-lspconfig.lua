return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }

    local new_opts = {
      diagnostics = {
        float = {
          border = require("config.global").border,
        },
      },
      servers = {
        ltex_plus = {
          settings = {
            ltex = {
              language = "en-US",
            },
          },
        },
      },
      setup = {
        ltex_plus = function(_, ltex_plus_opts)
          ltex_plus_opts.on_attach = function()
            vim.opt_local.spell = false
          end
        end,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

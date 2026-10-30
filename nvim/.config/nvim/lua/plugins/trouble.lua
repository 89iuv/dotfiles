return {
  "folke/trouble.nvim",
  cmd = "Trouble",
   keys = {
    {
      "<leader>ci",
      "<cmd>Trouble lsp_incoming_calls toggle<CR>",
      desc = "Lsp Incoming Calls",
    },
    {
      "<leader>co",
      "<cmd>Trouble lsp_outgoing_calls toggle<CR>",
      desc = "Lsp Outgoing Calls",
    },
    {
      "<leader>cr",
      "<cmd>Trouble lsp_references toggle<CR>",
      desc = "Lsp References",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle<CR>",
      desc = "Lsp Symbols"
    },
  },
  opts = {
    auto_refresh = false,
    preview = {
      scratch = true,
      bo = {
        filetype = "trouble_preview",
      }
    },
    modes = {
      lsp = {
        focus = true,
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.4,
          wo = {
            number = true,
          },
        },
        win = {
          position = "bottom",
          size = 0.35,
        },
      },
      lsp_base = {
        focus = true,
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.4,
          wo = {
            number = true,
          },
        },
        win = {
          position = "bottom",
          size = 0.35,
        },
      },
      symbols = {
        focus = true,
        auto_preview = false,
        auto_refresh = true,
        follow = false,
        win = {
          size = 45,
        },
        format = "{kind_icon} {symbol.name}",
      },
    },
  },
}

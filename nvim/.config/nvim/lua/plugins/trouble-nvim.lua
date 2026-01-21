return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>ch",
      desc = "Lsp Hierarchy (Trouble)",
    },
    {
      "<leader>chi",
      "<cmd>Trouble lsp_incoming_calls<CR>",
      desc = "Lsp Incoming Calls",
    },
    {
      "<leader>cho",
      "<cmd>Trouble lsp_outgoing_calls<CR>",
      desc = "Lsp Outgoing Calls",
    },
    {
      "<leader>chr",
      "<cmd>Trouble lsp_references<CR>",
      desc = "Lsp References",
    },
  },
  opts = {
    auto_refresh = false,
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
        win = {
          size = 45,
        },
        format = "{kind_icon} {symbol.name}",
      },
    },
  },
}

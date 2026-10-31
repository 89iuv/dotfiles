return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    -- lsp
    {
      "<leader>xs",
      "<cmd>Trouble lsp_document_symbols toggle focus=true fallow=true win.position=right win.size=55<cr>",
      desc = "Lsp Document Symbols",
    },
    { "<leader>xl", "<cmd>Trouble lsp win.position=right win.size=55<cr>", desc = "LSP references/definitions/..." },
    { "<leader>xr", "<cmd>Trouble lsp_references<CR>", desc = "Lsp References" },

    { "<leader>xi", "<cmd>Trouble lsp_incoming_calls toggle<CR>", desc = "Lsp Incoming Calls" },
    { "<leader>xo", "<cmd>Trouble lsp_outgoing_calls toggle<CR>", desc = "Lsp Outgoing Calls" },

    -- diagnostics
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    { "<leader>xD", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostic" },

  },
  opts = {
    auto_preview = false,
    auto_refresh = false,
    follow = false,
    focus = true,
    preview = {
      scratch = false,
      bo = {
        filetype = "trouble_preview",
      },
    },
  },
}

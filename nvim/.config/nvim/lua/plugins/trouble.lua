return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    -- lsp
    { "<leader>cd", "<cmd>Trouble lsp_definitions<cr>", desc = "Lsp Definition" },
    { "<leader>cD", "<cmd>Trouble lsp_declarations<cr>", desc = "lsp Declaration" },
    { "<leader>cr", "<cmd>Trouble lsp_references<CR>", desc = "Lsp References" },
    { "<leader>cI", "<cmd>Trouble lsp_implementations<cr>", desc = "Lsp Implementation" },
    { "<leader>cy", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Lsp Type Definition" },
    { "<leader>ci", "<cmd>Trouble lsp_incoming_calls<CR>", desc = "Lsp Incoming Calls" },
    { "<leader>co", "<cmd>Trouble lsp_outgoing_calls<CR>", desc = "Lsp Outgoing Calls" },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=true fallow=true win.position=right win.size=55<cr>",
      desc = "Lsp Document Symbols",
    },
    { "<leader>cl", "<cmd>Trouble lsp win.position=right win.size=55<cr>", desc = "LSP References/Definitions/..." },

    -- diagnostics
    { "<leader>cx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics" },
    { "<leader>cX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostic" },
  },
  opts = {
    auto_preview = false,
    auto_refresh = false,
    follow = false,
    focus = true,
    preview = {
      scratch = true,
      bo = {
        filetype = "trouble_preview",
      },
    },
  },
}

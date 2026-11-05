return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    -- lsp
    { "<leader>xd", "<cmd>Trouble lsp_definitions<cr>", desc = "Lsp Definition" },
    { "<leader>xD", "<cmd>Trouble lsp_declarations<cr>", desc = "lsp Declaration" },
    { "<leader>xr", "<cmd>Trouble lsp_references<CR>", desc = "Lsp References" },
    { "<leader>xI", "<cmd>Trouble lsp_implementations<cr>", desc = "Lsp Implementation" },
    { "<leader>xy", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Lsp Type Definition" },
    { "<leader>xai", "<cmd>Trouble lsp_incoming_calls<CR>", desc = "Lsp Incoming Calls" },
    { "<leader>xao", "<cmd>Trouble lsp_outgoing_calls<CR>", desc = "Lsp Outgoing Calls" },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle auto_refresh=true focus=true win.position=right win.size=55<cr>",
      desc = "Lsp Document Symbols",
    },
    { "<leader>xl", "<cmd>Trouble lsp win.position=right win.size=55<cr>", desc = "LSP References/Definitions/..." },

    -- diagnostics
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostic" },
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
    icons = {
      indent = {
        top = "│ ",
        middle = "│ ",
        last = "└╴",
        fold_open = " ",
        fold_closed = " ",
        ws = "  ",
      },
    },
  },
}

return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
  config = function()
    vim.keymap.set("t", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true })
    vim.keymap.set("t", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true })
    vim.keymap.set("t", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true })
    vim.keymap.set("t", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })
    vim.keymap.set("t", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { noremap = true })
  end,
}

return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "t" } },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "t" } },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "t" } },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "t" } },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n", "t" } },
  },
  config = function()
    vim.keymap.set("t", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true })
    vim.keymap.set("t", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true })
    vim.keymap.set("t", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true })
    vim.keymap.set("t", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })
    vim.keymap.set("t", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { noremap = true })
  end,
}

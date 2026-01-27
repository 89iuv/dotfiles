-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diff windows
vim.keymap.set("n", "<leader>wa", ":diffthis<CR>", { silent = true, desc = "Add to Diff" })
vim.keymap.set("n", "<leader>wr", ":diffoff<CR>", { silent = true, desc = "Remove from Diff" })
vim.keymap.set("n", "<leader>wA", ":windo diffthis<CR>", { silent = true, desc = "Add all to Diff" })
vim.keymap.set("n", "<leader>wR", ":windo diffoff<CR>", { silent = true, desc = "Remove all from Diff" })

-- Incremental selection
vim.keymap.set({ "n", "x", "o" }, "<M-o>", function()
  require("flash").treesitter({
    actions = {
      ["<M-o>"] = "next", -- outer
      ["<M-i>"] = "prev", -- inward
    },
  })
end, { desc = "Treesitter incremental selection" })

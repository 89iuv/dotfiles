-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

-- use Shift + j,k instead of Ctrl+u,d for scrolling in normal mode
vim.keymap.set("n", "J", "<C-d>", { remap = false})
vim.keymap.set("n", "K", "<C-u>", { remap = false})

-- use Shift + j,k instead of Ctrl+u,d for scrolling in visual mode
vim.keymap.set("v", "J", "<C-d>", { remap = false})
vim.keymap.set("v", "K", "<C-u>", { remap = false})

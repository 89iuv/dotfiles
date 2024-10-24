-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- bind hjkl in insert mode to move cursor
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = false, silent = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

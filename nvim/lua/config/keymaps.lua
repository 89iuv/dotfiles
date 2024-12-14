-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- bind hjkl in insert mode to move cursor
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = false, silent = true })

-- remap resize to be +5
vim.keymap.set("n", "<C-w>+", "<cmd>resize +5<cr>", { noremap = false, desc = "Increase height" })
vim.keymap.set("n", "<C-w>-", "<cmd>resize -5<cr>", { noremap = false, desc = "Decrease height" })
vim.keymap.set("n", "<C-w>>", "<cmd>vertical resize +5<cr>", { noremap = false, desc = "Increase width" })
vim.keymap.set("n", "<C-w><", "<cmd>vertical resize -5<cr>", { noremap = false, desc = "Decrease width" })

-- exit terminal using esc, esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

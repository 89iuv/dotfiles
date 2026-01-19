-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resize window using Meta (Alt) key
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Diff windows
local wk = require("which-key")
wk.add({ { "<leader>i", icon = { icon = "󰢪 ", color = "yellow" }, group = "diff" } })
vim.keymap.set("n", "<leader>it", ":windo diffthis<CR>", { silent = true, desc = "Diff This on all Windows" })
vim.keymap.set("n", "<leader>io", ":windo diffoff<CR>", { silent = true, desc = "Diff Off on all Windows" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resize window using Meta (Alt) key
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Show a notification if Treesitter is not loaded when trying to increment or decrement selection
vim.keymap.set("n", "<M-o>", function()
  vim.notify("Treesitter not loaded.\nIncrement Selection not available.", vim.log.levels.WARN)
end, { desc = "Increment Selection" })
vim.keymap.set("n", "<M-i>", function()
  vim.notify("Treesitter not loaded.\nDecrement Selection not available.", vim.log.levels.WARN)
end, { desc = "Decrement Selection" })

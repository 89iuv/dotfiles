-- Clear search highlighting with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigate between windows with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
    callback = function(event)
      vim.keymap.set("n", "<Esc>", "<cmd>q<CR>", { buffer = event.buf, silent = true })
    end,
})


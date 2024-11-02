-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Do not continue with comments on the next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Move QuickFix window to the bottom
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "qf",
  callback = function()
    vim.cmd("wincmd J")
  end,
})

-- Disable mini indentscope for unsuported buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "neotest-summary",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

-- disable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:v",
  callback = function()
    require("illuminate").pause()
  end,
})

-- enable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "v:*",
  callback = function()
    require("illuminate").resume()
  end,
})

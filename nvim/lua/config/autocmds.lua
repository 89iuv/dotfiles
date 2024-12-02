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

-- Disable spell check when ltex-ls LSP is attached to markdown file
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "ltex" then
      vim.opt_local.spell = false
    end
  end,
})

-- Disable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "n:*",
  callback = function()
    require("illuminate").pause()
  end,
})

-- Enable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  callback = function()
    require("illuminate").resume()
  end,
})

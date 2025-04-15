-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- overwrite highlight mode for nvim_buf_set_extmark
local old_nvim_buf_set_extmark = vim.api.nvim_buf_set_extmark
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_buf_set_extmark = function(buffer, ns_id, line, col, opts)
  opts.hl_mode = "combine"
  return old_nvim_buf_set_extmark(buffer, ns_id, line, col, opts)
end

-- overwrite border style for nvim_open_win
local old_nvim_open_win = vim.api.nvim_open_win
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_open_win = function(buffer, enter, config)
  if config.border == "rounded" then
    config.border = "single"
  end
  return old_nvim_open_win(buffer, enter, config)
end

-- overwrite border style for nvim_win_set_config
local old_nvim_win_set_config = vim.api.nvim_win_set_config
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_win_set_config = function(window, config)
  if config.border == "rounded" then
    config.border = "single"
  end
  return old_nvim_win_set_config(window, config)
end

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "json5", "http" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Disable conceallevel for buftype
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local patterns = {
      "nofile",
    }
    for _, pattern in ipairs(patterns) do
      if pattern == vim.bo.buftype then
        vim.opt_local.conceallevel = 0
      end
    end
  end,
})

-- Do not continue with comments on the next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
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

-- Disable relative line number when entering insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:i",
  callback = function()
    if vim.wo.number == true then
      vim.wo.relativenumber = false
    end
  end,
})

-- Enable relative line number when exiting insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "i:*",
  callback = function()
    if vim.wo.number == true then
      vim.wo.relativenumber = true
    end
  end,
})

-- Set cursor on enter
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
  end,
})

-- Set cursor on exit
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    vim.o.guicursor = "a:ver25"
  end,
})

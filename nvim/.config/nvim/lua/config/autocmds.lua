-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Helper function to crate augroup name
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Overwrite highlight mode
local old_nvim_buf_set_extmark = vim.api.nvim_buf_set_extmark
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_buf_set_extmark = function(buffer, ns_id, line, col, opts)
  opts.hl_mode = "combine"
  return old_nvim_buf_set_extmark(buffer, ns_id, line, col, opts)
end

-- Overwrite border style for nvim open window
local old_nvim_open_win = vim.api.nvim_open_win
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_open_win = function(buffer, enter, config)
  if config.border == "rounded" then
    config.border = require("config.global").border
  end
  return old_nvim_open_win(buffer, enter, config)
end

-- Overwrite border style for nvim configure window
local old_nvim_win_set_config = vim.api.nvim_win_set_config
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_win_set_config = function(window, config)
  if config.border == "rounded" then
    config.border = require("config.global").border
  end
  return old_nvim_win_set_config(window, config)
end

-- Do not continue with comments on the next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Use 4 spaces to indent in java files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "json5", "http" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Set spell and wrap in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = false
  end,
})

-- Disable conceallevel
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "kulala://ui" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Move help file to the right
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
  end,
})

-- Close some filetypes with <q> and <esc>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
      vim.keymap.set("n", "<esc>", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "neotest-output",
    "neotest-output-panel",
    "neotest-attach",
    "neotest-summary",
  },
  group = augroup("NeotestConfig"),
  callback = function(opts)
    vim.keymap.set("n", "q", function()
      pcall(vim.api.nvim_win_close, 0, true)
    end, {
      buffer = opts.buf,
      silent = true,
      desc = "Close window",
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function()
    vim.wo.winhighlight = "Normal:NormalFloat"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "copilot-*" },
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end,
})

-- Disable relative line number when entering insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "[vV\x16]:*",
  callback = function()
    if vim.wo.number == true then
      vim.wo.relativenumber = false
    end
  end,
})

-- Enable relative line number when exiting insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:[vV\x16]",
  callback = function()
    if vim.wo.number == true then
      vim.wo.relativenumber = true
    end
  end,
})

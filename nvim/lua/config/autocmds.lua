-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

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

-- close some filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_esc"),
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
    "snacks_win",
    "startuptime",
    "copilot-chat",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
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

-- Disable mini indentscope for unsuported buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "Trouble",
    "help",
    "lazy",
    "mason",
    "neo-tree",
    "notify",
    "snacks_notif",
    "snacks_terminal",
    "snacks_win",
    "trouble",
    "copilot-chat",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

-- disable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "*:v", "*:i" },
  callback = function()
    require("illuminate").pause()
  end,
})

-- enable word highlight when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "v:*", "i:*" },
  callback = function()
    require("illuminate").resume()
  end,
})

-- Overwrite border style for nvim open window
local old_nvim_open_win = vim.api.nvim_open_win
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_open_win = function(buffer, enter, config)
  if config.border == "rounded" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    config.border = "single"
  end
  return old_nvim_open_win(buffer, enter, config)
end

-- Overwrite border style for nvim configure window
local old_nvim_win_set_config = vim.api.nvim_win_set_config
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_win_set_config = function(window, config)
  if config.border == "rounded" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    config.border = "single"
  end
  return old_nvim_win_set_config(window, config)
end

-- Higlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank() end,
})

-- Do not continue with comments on the next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

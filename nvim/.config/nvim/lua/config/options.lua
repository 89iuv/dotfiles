-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.ua
-- Add any additiona options here

vim.g.root_spec = { "cwd" }

vim.g.snacks_animate = false
vim.g.trouble_lualine = false
vim.g.autoformat = false

vim.opt.pumblend = 0
vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.foldtext = 'v:lua.CustomFoldText()'
function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return line .. ' ... ' .. num_lines .. ' lines'
end

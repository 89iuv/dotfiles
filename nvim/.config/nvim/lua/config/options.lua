-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.ua
-- Add any additiona options here

-- make lazy use the cwd as root
-- cwd is the directory where you start nvim
-- root is the project root (determined by lsp, .git, etc.) for the opened file
-- use ":LazyRoot" to identify the project root
-- note: the project root si always bellow or equal to the cwd
-- vim.g.root_spec = { "cwd" }

vim.g.snacks_animate = false
vim.g.trouble_lualine = false
vim.g.autoformat = false

vim.o.guicursor = "n-c:block,i-ci:ver25,r-cr:hor20,o:hor50,v-ve:hor80"

vim.opt.swapfile = false
vim.opt.pumblend = 0
vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- format for folded lines
vim.opt.foldtext = 'v:lua.CustomFoldText()'
function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return line .. ' ... ' .. num_lines .. ' lines'
end

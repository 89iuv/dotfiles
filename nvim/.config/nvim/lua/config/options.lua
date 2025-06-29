-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.ua
-- Add any additiona options here

-- make lazy use the cwd as root
-- cwd is the directory where you start nvim
-- root is the project root (determined by lsp, .git, etc.) for the opened file
-- use ":LazyRoot" to identify the project root
-- note: the project root si always bellow or equal to the cwd
-- vim.g.root_spec = { "cwd" }

vim.g.animate_fps = 60

vim.g.animate_enabled = false
vim.g.smear_cursor_animate = true
vim.g.snacks_animate = nil -- use local override, change for global override

vim.g.trouble_lualine = false
vim.g.autoformat = false

vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve-t:ver25,r-cr-o:hor20"
-- vim.opt.conceallevel = 0

-- vim.o.winborder = "none"

vim.opt.pumblend = 0
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.relativenumber = true
vim.opt.list = true

vim.opt.swapfile = false

-- format for folded lines
vim.opt.foldtext = "v:lua.CustomFoldText()"
function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return line .. " ... " .. num_lines .. " lines"
end

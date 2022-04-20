vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn="yes:1"

vim.opt.wrap = false

vim.opt.mouse = "a"

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.undofile = true
vim.diagnostic.config({
  signs = false,
  update_in_insert = true,
  severity_sort = true,
})


-- Leader key: spacebar for both normal and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Color & clipboard: enable true colors and share clipboard with OS
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termsync = true

-- Persistence: save undo history across sessions, disable swap files
vim.opt.undofile = true
vim.opt.swapfile = false

-- Line numbers: enable absolute and relative line numbers, set number column width
vim.opt.number = true
vim.opt.relativenumber = false

-- UI: show cursor line, line numbers, sign column, invisible characters, no wrap
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:2"
vim.opt.list = true
vim.opt.listchars:append({ tab = "» ", trail = "·", nbsp = "␣" })
vim.opt.fillchars:append({ eob = " " })
vim.opt.wrap = false

vim.opt.laststatus = 3

-- Indentation: 2-space tabs, smart/auto indent, break indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Search: case-insensitive by default, case-sensitive if any uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split windows: new splits open to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse: enable mouse support in all modes
vim.opt.mouse = "a"

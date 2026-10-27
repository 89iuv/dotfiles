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
-- Good idea, lazy does not play nice with this setting
-- vim.opt.winborder = "single"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:2"
vim.opt.list = true
vim.opt.listchars:append({ tab = "» ", trail = "·", nbsp = "␣" })

vim.opt.fillchars:append({ eob = " " })

-- Folds
vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.opt.fillchars:append({
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
})

-- Text
vim.opt.wrap = false

-- Status Line
vim.opt.laststatus = 3

-- Indentation
vim.opt.tabstop = 4 -- number of spaces to render a tab

vim.opt.expandtab = true -- converts tab keypress into space char
vim.opt.softtabstop = 2 -- number of space for tab and backspace keypress in insert mode
vim.opt.shiftwidth = 2 -- number of spaces to for indentation << >>, enter to new line, and autoindent

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

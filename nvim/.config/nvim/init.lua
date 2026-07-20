-- [[ Set <space> as the leader key ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Core options ]]
vim.opt.termguicolors = true
vim.schedule(function() vim.o.clipboard = "unnamedplus" end)
vim.o.undofile = true

vim.o.cursorline = true
vim.o.number = true
vim.o.signcolumn = "yes"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.o.foldlevel = 99

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.mouse = "a"

-- [[ Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- [[ Autocmds ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank() end,
})

-- [[ Plugins Loading ]]
vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim' },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
})

-- [[ Plugins Config ]]
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
})

require('smear_cursor').setup({
  hide_target_hack = false,
  cursor_color = "none",

  never_draw_over_target = false,
  legacy_computing_symbols_support = false,

  smear_insert_mode = false,
  smear_terminal_mode = true,
  smear_to_cmd = true,

  delay_event_to_smear = (1000 / 60 / 2),
  time_interval = 1000 / 60,

  stiffness = 0.6,
  trailing_stiffness = 0.4,
  anticipation = 0.2,
  damping = 0.8,

  max_length = 25,
})

-- [[ Set <space> as the leader key ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Core options ]]
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.wrap = false

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.wo.foldlevel = 99

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"

-- [[ Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- [[ Autocmds ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank() end,
})

-- [[ Plugins Loading ]]
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- [[ Plugins Config ]]
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
})

require("smear_cursor").setup({
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

require("nvim-treesitter").install({
  "lua",
  "bash"
})


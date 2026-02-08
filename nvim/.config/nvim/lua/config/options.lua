-- Options are automatically loaded before lazy.nvim start up
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.ua
-- Add any additional options here

-- make lazy use the cwd as root
-- cwd is the directory where you start nvim
-- root is the project root (determined by lsp, .git, etc.) for the opened file
-- use ":LazyRoot" to identify the project root
-- note: the project root is always bellow or equal to the cwd
-- vim.g.root_spec = { "cwd" }

vim.g.animate_fps = 60

vim.g.smear_cursor_animate = true
vim.g.snacks_animate = false
vim.g.image_support = false
vim.g.virt_column = true
vim.g.border = "single"

vim.g.trouble_lualine = false
vim.g.autoformat = false

vim.g.root_spec = { "lsp", { ".git", "lua", ".root" }, "cwd" }

vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon0-blinkoff0-blinkwait0"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.relativenumber = false
vim.opt.breakindent = true
vim.opt.list = true
vim.opt.swapfile = false
vim.opt.undofile = true

-- programing languages lsp
vim.g.lazyvim_python_lsp = "basedpyright"

-- disable providers as they are not being used
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

vim.g.special_filetypes = {
  -- default
  "lspinfo",
  "packer",
  "checkhealth",
  "help",
  "man",
  "gitcommit",
  "TelescopePrompt",
  "TelescopeResults",

  -- lazy
  "Trouble",
  "alpha",
  "dashboard",
  "fzf",
  "help",
  "lazy",
  "mason",
  "neo-tree",
  "notify",
  "snacks_dashboard",
  "snacks_notif",
  "snacks_terminal",
  "snacks_win",
  "toggleterm",
  "trouble",

  -- custom
  -- "markdown",
  "snacks_picker_preview",
  "snacks_picker_list",
  "snacks_picker_input",
  "snacks_input",
  "neo-tree-popup",
  "text",
  "noice",
}

vim.g.special_buftypes = {
  -- default
  "nofile",
  "terminal",
  "quickfix",
  "prompt",

  -- custom
  "help",
}

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set termguicolors
vim.g.termguicolors = true

-- disable netrw needed for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- status bar set width to full scree
vim.opt.laststatus = 3

-- disable word wrap
vim.opt.wrap = false

-- Limit the completion height
vim.opt.pumheight = 10

-- Enable spell check
vim.opt.spell = true

-- Diagnostics config
vim.diagnostic.config {
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  },
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded' },
}

-- Diagnostics highlight sign column
for _, diag in ipairs { 'Error', 'Warn', 'Info', 'Hint' } do
  vim.fn.sign_define('DiagnosticSign' .. diag, {
    text = '',
    texthl = 'DiagnosticSign' .. diag,
    linehl = '',
    numhl = 'DiagnosticSign' .. diag,
  })
end

-- -- Diagnostics change the sign simbol in the gutter
-- local signs = { Error = ' ', Warn = ' ', Hint = '', Info = ' ' }
-- for type, icon in pairs(signs) do
--   local hl = 'DiagnosticSign' .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- -- Diagnostics show only one sign
-- -- https://neovim.io/doc/user/diagnostic.html#diagnostic-handlers
-- -- Create a custom namespace. This will aggregate signs from all other
-- -- namespaces and only show the one with the highest severity on a
-- -- given line
-- local ns = vim.api.nvim_create_namespace 'my_namespace'
-- -- Get a reference to the original signs handler
-- local orig_signs_handler = vim.diagnostic.handlers.signs
-- -- Override the built-in signs handler
-- vim.diagnostic.handlers.signs = {
--   show = function(_, bufnr, _, opts)
--     -- Get all diagnostics from the whole buffer rather than just the
--     -- diagnostics passed to the handler
--     local diagnostics = vim.diagnostic.get(bufnr)
--     -- Find the "worst" diagnostic per line
--     local max_severity_per_line = {}
--     for _, d in pairs(diagnostics) do
--       local m = max_severity_per_line[d.lnum]
--       if not m or d.severity < m.severity then
--         max_severity_per_line[d.lnum] = d
--       end
--     end
--     -- Pass the filtered diagnostics (with our custom namespace) to
--     -- the original handler
--     local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
--     orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
--   end,
--   hide = function(_, bufnr)
--     orig_signs_handler.hide(ns, bufnr)
--   end,
-- }

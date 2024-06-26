-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Do not continue with comments on the next line
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})

-- Disable spell check in terminal
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.o.spell = false
  end,
})

-- Move QuickFix window to the bottom
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.cmd [[
      wincmd J | setl nobuflisted
    ]]
  end,
})

-- Hide diagnostics when entering insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  callback = function()
    vim.diagnostic.hide(nil, 0)
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    vim.diagnostic.show(nil, 0)
  end,
})

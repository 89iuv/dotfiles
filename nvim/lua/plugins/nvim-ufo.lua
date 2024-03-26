return {
  'kevinhwang91/nvim-ufo',
  event = 'BufEnter',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  config = function()
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    require('ufo').setup {
      provider_selector = function(_, _, _)
        return { 'lsp', 'indent' }
      end,
    }
  end,
}

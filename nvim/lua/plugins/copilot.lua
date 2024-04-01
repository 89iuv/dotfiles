return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_filetypes = {
      ['*'] = false,
    }

    vim.keymap.set('i', '<M-Enter>', 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
  end,
}

return {
  'github/copilot.vim',
  config = function()
    -- disable copilot suggestions
    vim.g.copilot_filetypes = {
      -- ['*'] = false,
    }

    vim.keymap.set('i', '<Right>', 'copilot#Accept("\\<Right>")', {
      expr = true,
      replace_keycodes = false,
    })

    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<Tab>', '<Tab>')
  end,
}

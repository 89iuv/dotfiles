return {
  'github/copilot.vim',
  config = function()
    -- variables
    vim.g.disable_copilot = false

    -- disable copilot suggestions
    vim.g.copilot_filetypes = {
      ['*'] = vim.g.disable_copilot,
    }

    vim.keymap.set('i', '<Right>', 'copilot#Accept("\\<Right>")', {
      expr = true,
      replace_keycodes = false,
      silent = true, -- disable echo in command line
    })

    vim.keymap.set('i', '<C-\\>', 'copilot#Suggest()', {
      expr = true,
      replace_keycodes = false,
      silent = true, -- disable echo in command line
    })

    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<Tab>', '<Tab>')

    vim.api.nvim_create_user_command('ToggleCopilot', function()
      vim.g.disable_copilot = not vim.g.disable_copilot
      if not vim.g.disable_copilot then
        vim.cmd 'Copilot enable'
      else
        vim.cmd 'Copilot disable'
      end
      vim.notify('Copilot: ' .. (vim.g.disable_copilot and 'Disabled' or 'Enabled'))
    end, {
      desc = 'Toggle Copilot',
    })

    vim.keymap.set('n', '<leader>tc', '<ESC><cmd>ToggleCopilot<CR>', { desc = '[T]oggle [C]opilot' })
  end,
}

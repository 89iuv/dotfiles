return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        shade_terminals = false,
        start_in_insert = false,
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
      }

      require('which-key').register {
        ['<leader>c'] = { name = '[T]erminal', _ = 'which_key_ignore' },
      }
      vim.keymap.set('n', '<leader>tv', '<CMD>ToggleTerm direction=vertical<CR>', { desc = 'Terminal [V]ertical' })
      vim.keymap.set('n', '<leader>th', '<CMD>ToggleTerm direction=horizontal<CR>', { desc = 'Terminal [H]orizontal' })
      vim.keymap.set('n', '<leader>ts', '<CMD>TermSelect<CR>', { desc = '[T]erminal [S]elect' })
    end,
  },
}

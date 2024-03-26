return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
      },
      view = {
        adaptive_size = true,
      },
    }

    require('which-key').register {
      ['<leader>n'] = { name = '[N]vimtree', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>', { desc = '[N]vimtree [T]oggle window' })
    vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFocus<CR>', { desc = '[N]vimtree [F]ocus window' })
    vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>', { desc = '[N]vimtree [R]efresh window' })
  end,
}

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
        -- width = 40,
        width = {
          min = 30,
          max = 90,
          padding = 2,
        },
        preserve_window_proportions = true,
      },
      renderer = {
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = '│',
            edge = '│',
            item = '│',
            bottom = '─',
            none = '│',
          },
        },
        icons = {
          show = {
            folder_arrow = true,
          },
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      filters = {
        git_ignored = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
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

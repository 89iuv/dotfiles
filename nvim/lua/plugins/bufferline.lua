return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'echasnovski/mini.nvim', version = false },
    {
      'echasnovski/mini.bufremove',
      version = false,
      config = function()
        require('mini.bufremove').setup()

        vim.keymap.set('n', '<leader>x', function()
          require('mini.bufremove').delete(0, true)
        end, { desc = 'E[X]it buffer' })
      end,
    },
  },
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'

    require('bufferline').setup {
      options = {
        close_command = function()
          require('mini.bufremove').delete(0, true)
        end,
        themable = true,
        offsets = {
          {
            filetype = 'NvimTree',
            separator = false,
          },
        },
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        separator_style = { '|', '|' },
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get {
        custom = {
          all = {
            indicator_selected = { fg = mocha.lavender, style = {} },
            indicator_visible = { fg = mocha.mantle, bg = mocha.mantle },

            buffer_selected = { fg = mocha.lavender, style = {} }, -- current

            modified = { fg = mocha.lavender },
            modified_selected = { fg = mocha.lavender },
          },
        },
      },
    }

    require('which-key').register {
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer Close [O]thers' })
    vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineMoveNext<CR>', { desc = '[B]uffer Move [N]ext' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineMovePrev<CR>', { desc = '[B]uffer Move [P]revious' })
  end,
}

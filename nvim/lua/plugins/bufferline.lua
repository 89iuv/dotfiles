return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'echasnovski/mini.bufremove',
      version = false,
      config = function()
        require('mini.bufremove').setup()
      end,
    },
  },
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'

    require('bufferline').setup {
      options = {
        close_command = function(bufNum)
          require('mini.bufremove').delete(bufNum, false)
        end,
        themable = true,
        offsets = {
          {
            filetype = 'NvimTree',
            separator = false,
          },
        },
        diagnostics = 'nvim_lsp',
        separator_style = { '|', '|' },
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get {
        custom = {
          all = {
            indicator_selected = { fg = mocha.lavender },
            indicator_visible = { fg = mocha.mantle, bg = mocha.mantle },

            buffer_selected = { fg = mocha.lavender }, -- current

            modified = { fg = mocha.lavender },
            modified_visible = { fg = mocha.lavender },
            modified_selected = { fg = mocha.lavender },
          },
        },
      },
    }

    require('which-key').add {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>bm', group = '[B]uffer [M]ove' },
      { '<leader>bc', group = '[B]uffer [C]lose' },
    }

    vim.keymap.set('n', '<leader>x', function()
      require('mini.bufremove').delete(0, true)
    end, { desc = 'E[X]it buffer' })

    vim.keymap.set('n', '<leader>bmn', '<cmd>BufferLineMoveNext<CR>', { desc = '[B]uffer [M]ove [N]ext' })
    vim.keymap.set('n', '<leader>bmp', '<cmd>BufferLineMovePrev<CR>', { desc = '[B]uffer [M]ove [P]revious' })

    vim.keymap.set('n', '<leader>bcr', '<cmd>BufferLineCloseRight<CR>', { desc = '[B]uffer [C]lose [R]ight' })
    vim.keymap.set('n', '<leader>bcl', '<cmd>BufferLineCloseLeft<CR>', { desc = '[B]uffer [C]lose [L]eft' })
    vim.keymap.set('n', '<leader>bco', '<cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer [C]lose [O]thers' })
  end,
}

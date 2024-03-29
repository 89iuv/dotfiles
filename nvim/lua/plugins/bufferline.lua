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
        end, { desc = 'Remove buffer' })
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

            buffer_selected = { fg = mocha.lavender, style = {} }, -- current

            modified = { fg = mocha.lavender },
            modified_selected = { fg = mocha.lavender },
          },
        },
      },
    }
  end,
}

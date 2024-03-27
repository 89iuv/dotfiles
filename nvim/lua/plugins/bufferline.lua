return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'ojroques/nvim-bufdel',
  },
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'

    require('bufferline').setup {
      options = {
        themable = true,
        offsets = {
          {
            filetype = 'NvimTree',
          },
        },
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get {
        custom = {
          all = {
            indicator_selected = { fg = mocha.lavender },

            buffer_selected = { fg = mocha.lavender, style = {} }, -- current

            modified = { fg = mocha.lavender },
            modified_selected = { fg = mocha.lavender },
          },
        },
      },
    }
  end,
}

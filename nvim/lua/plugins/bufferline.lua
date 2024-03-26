return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'ojroques/nvim-bufdel',
  },
  config = function()
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
            indicator_selected = { fg = '#b4befe' },
          },
        },
      },
    }
  end,
}

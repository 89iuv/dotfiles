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
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
    }
  end,
}

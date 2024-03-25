return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
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

return {
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {
          char = '│',
        },
        scope = {
          enabled = false,
          char = '│',
          show_start = false,
          show_end = false,
        },
      }
    end,
  },

  { 'echasnovski/mini.nvim', version = false },
  { 'echasnovski/mini.pairs', version = false, opts = {} },
}

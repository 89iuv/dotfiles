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
          include = {
            node_type = { ['*'] = { '*' } },
          },
        },
      }
    end,
  },

  { 'echasnovski/mini.pairs', version = false, opts = {} },
  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup {
        draw = {
          delay = 0,
          animation = require('mini.indentscope').gen_animation.none(),
        },
        symbol = '│',
      }

      vim.api.nvim_create_autocmd('FileType', {
        desc = 'Disable indentscope for certain filetypes',
        pattern = {
          'NvimTree',
          'help',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'better_term',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  { 'echasnovski/mini.starter', version = false, opts = {} },
  { 'echasnovski/mini.animate', version = false, opts = {} },
}

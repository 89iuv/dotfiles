return {
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  { 'numToStr/Comment.nvim', opts = {} },

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
          'noice',
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- helper keymaps to move forward and backward using [key ]key
  { 'echasnovski/mini.bracketed', version = false, opts = {} },
  { 'echasnovski/mini.starter', version = false, opts = {} },
}

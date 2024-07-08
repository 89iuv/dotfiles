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

  -- helper keymaps to move forward and backward using '[<c>' and ']<c>' keys
  { 'echasnovski/mini.bracketed', version = false, opts = {} },

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

  {
    'MaximilianLloyd/ascii.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  -- helper keymaps to move forward and backward using [key ]key
  { 'echasnovski/mini.bracketed', version = false, opts = {} },
  {
    'echasnovski/mini.starter',
    dependencies = {
      'MaximilianLloyd/ascii.nvim',
    },
    version = false,
    config = function()
      local header = require('ascii').art.text.neovim.ansi_shadow
      local starter = require 'mini.starter'
      require('mini.starter').setup {
        header = table.concat(header, '\n'),
        evaluate_single = false,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(5, true),
          starter.sections.recent_files(5, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('all', { 'Builtin actions' }),
          starter.gen_hook.padding(1, 1),
        },
      }
    end,
  },
}

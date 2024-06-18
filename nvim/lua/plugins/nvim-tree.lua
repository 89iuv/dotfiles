return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'
      local builtin = require 'telescope.builtin'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function search_by_grep_in_current_node()
        local node = api.tree.get_node_under_cursor()
        builtin.live_grep { cwd = node.absolute_path }
      end

      local function search_files_in_current_node()
        local node = api.tree.get_node_under_cursor()
        builtin.find_files { cwd = node.absolute_path }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- on_attach
      vim.keymap.set('n', '<leader>sg', search_by_grep_in_current_node, opts 'Search by Grep in current node')
      vim.keymap.set('n', '<leader>sf', search_files_in_current_node, opts 'Search Files in current node')
    end

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      disable_netrw = true,
      hijack_cursor = false,
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 40,
      },
      renderer = {
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ':t')
        end,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = '│',
            edge = '│',
            item = '│',
            bottom = '─',
            none = '│',
          },
        },
        icons = {
          show = {
            folder_arrow = true,
          },
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      filters = {
        git_ignored = false,
      },
      actions = {
        open_file = {
          resize_window = false,
          window_picker = {
            enable = false,
          },
        },
      },
    }

    require('which-key').register {
      ['<leader>n'] = { name = '[N]vimtree', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>', { desc = '[N]vimtree [T]oggle window' })
    vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFocus<CR>', { desc = '[N]vimtree [F]ocus window' })
    vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>', { desc = '[N]vimtree [R]efresh window' })
  end,
}

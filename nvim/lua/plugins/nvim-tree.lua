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

      local function search_in_current_node(telescope_builtin, message)
        local node = api.tree.get_node_under_cursor()
        local path = node.absolute_path
        if vim.fn.isdirectory(path) == 0 then
          path = vim.fs.dirname(path)
        end

        vim.notify(message .. ' ' .. path)
        vim.cmd [[
          wincmd p
        ]]
        telescope_builtin { cwd = path }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- on_attach
      vim.keymap.set('n', '<leader>sg', function()
        search_in_current_node(builtin.live_grep, 'Searching by Grep in:')
      end, opts 'Search by Grep in current node')

      vim.keymap.set('n', '<leader>sf', function()
        search_in_current_node(builtin.find_files, 'Searching Files in:')
      end, opts 'Search Files in current node')
    end
    -- disable status column for nvim-tree
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        if vim.bo.filetype == 'NvimTree' then
          vim.wo.statuscolumn = ''
        end
      end,
    })

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      disable_netrw = true,
      hijack_cursor = false, -- hijacking the cursor prevents scrolling to the right to reveal the full name of the file
      update_focused_file = {
        enable = false,
      },
      view = {
        width = {
          min = 35,
          max = 80,
          padding = 2,
        },
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
        enable = false,
        git_ignored = false,
        dotfiles = true,
        -- exclude pyton cache directory, use U to toggle it
        custom = { '__pycache__' },
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

    require('which-key').add {
      { '<leader>n', group = '[N]vimtree' },
    }

    -- toggle wrapper in order to deal with quickfix window
    local nvim_tree_toogle = function()
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
      -- if current buffer is quickfix then move to previous buffer before toggling nvim-tree
      if filetype == 'qf' then
        vim.cmd [[
          wincmd p | NvimTreeToggle
        ]]
      else
        vim.cmd [[
          NvimTreeToggle
        ]]
      end

      local is_quickfix = false
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local is_buffer_type_qf = vim.api.nvim_get_option_value('filetype', { buf = buf }) == 'qf'
        local is_buffer_hidden = vim.fn.getbufinfo(buf)[1].hidden == 1
        if is_buffer_type_qf and not is_buffer_hidden then
          is_quickfix = true
          break
        end
      end

      if is_quickfix then
        vim.cmd [[
          cclose | copen | wincmd p
        ]]
      end
    end

    vim.keymap.set('n', '<leader>nt', nvim_tree_toogle, { desc = '[N]vimtree [T]oggle window' })
    vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>', { desc = '[N]vimtree [R]efresh window' })
    vim.keymap.set('n', '<leader>nl', '<cmd>NvimTreeFindFile<CR>', { desc = '[N]vimtree [L]ocate file' })
    vim.keymap.set('n', '<leader>nh', function()
      require('nvim-tree.api').tree.toggle_enable_filters()
    end, { desc = '[N]vimtree toggle [H]idden files' })
  end,
}

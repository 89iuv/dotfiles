local M = {}

M.lsp_config = {
  servers = {
    -- xml
    lemminx = {},

    -- lua
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },

    -- shell
    bashls = {},

    -- java
    jdtls = {},

    -- python
    pyright = {
      callback = function()
        -- Add keymap for organizing imports on lsp attach
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            if vim.lsp.get_client_by_id(args.data.client_id).name == 'pyright' then
              vim.keymap.set('n', '<leader>co', '<cmd>PyrightOrganizeImports<CR>', { desc = 'LSP: ' .. '[C]ode [O]rganize Python Imports' })
            end
          end,
        })
      end,
    },
  },
  exclude_lsp_config = {
    'jdtls', -- configuration is done via nvim-jdtls
  },
}

M.mason = {
  -- install other mason pachages which are not lsp servers
  ensure_installed = {
    -- lua
    'stylua',

    -- shell
    'shfmt',
    'shellcheck',

    -- python,
    'black',
    'pylint',
    'mypy',
  },
}

M.treesitter = {
  ensure_installed = {
    -- generic
    'markdown',
    'markdown_inline',
    'regex',
    'xml',

    -- vim
    'vim',
    'vimdoc',

    -- lua
    'lua',

    -- shell
    'bash',
    'tmux',

    -- java
    'java',

    -- python
    'python',
  },
}

M.conform = {
  formatters_by_ft = {
    -- lua
    lua = { 'stylua' },

    -- shell
    sh = { 'shfmt', 'shellcheck' },

    -- python
    python = { 'black' },
  },
}

M.nvim_lint = {
  formatters_by_ft = {
    -- python
    python = { 'mypy', 'pylint' },
  },
}
return M

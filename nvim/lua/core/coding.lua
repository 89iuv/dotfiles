-- TODO: rename this file to developer.lua

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
        vim.keymap.set('n', '<leader>co', '<cmd>PyrightOrganizeImports<CR>', { desc = 'LSP: ' .. '[C]ode [O]rganize Imports' })
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
return M

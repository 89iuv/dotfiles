-- TODO: rename this file to developer.lua

local M = {}

M.lsp_config = {
  servers = {
    -- generic
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
  },
}

M.mason = {
  ensure_installed = {
    -- generic
    'lemminx',

    -- lua
    'stylua',

    -- shell
    'shfmt',
    'shellcheck',

    -- java
    'jdtls',
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
  },
}

M.conform = {
  formatters_by_ft = {
    -- lua
    lua = { 'stylua' },

    -- shell
    sh = { 'shfmt', 'shellcheck' },
  },
}
return M

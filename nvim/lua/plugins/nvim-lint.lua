return {
  'mfussenegger/nvim-lint',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  event = 'BufEnter',
  config = function()
    local global_linters = require('global.languages').nvim_lint

    local available_linters = {}
    for filetype, linters in pairs(global_linters.formatters_by_ft) do
      available_linters[filetype] = {}
      for _, linter in ipairs(linters) do
        local out = vim.fn.system('which' .. ' ' .. linter)
        if not string.find(out, 'not found') then
          table.insert(available_linters[filetype], linter)
        end
      end
    end

    require('lint').linters_by_ft = available_linters

    -- Run linters on save
    vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost' }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require('lint').try_lint()
      end,
    })

    -- Reset diagnostics when changing text
    vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
      callback = function()
        local nvim_lint = require 'lint'
        local linters = nvim_lint.linters_by_ft[vim.bo.filetype] or {}

        for _, linter in ipairs(linters) do
          local ns = nvim_lint.get_namespace(linter)
          vim.diagnostic.reset(ns, 0)
        end
      end,
    })
  end,
}

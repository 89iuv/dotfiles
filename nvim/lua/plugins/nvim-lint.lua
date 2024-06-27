return {
  'mfussenegger/nvim-lint',
  event = 'BufEnter',
  config = function()
    local linters = require('global.languages').nvim_lint
    require('lint').linters_by_ft = linters.formatters_by_ft

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require('lint').try_lint()
      end,
    })
  end,
}

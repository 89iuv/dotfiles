return {
  'mfussenegger/nvim-lint',
  event = 'BufEnter',
  config = function()
    local linters = require('global.languages').nvim_lint
    require('lint').linters_by_ft = linters.formatters_by_ft

    for _, list_of_lintes in pairs(linters.formatters_by_ft) do
      for _, linter_name in ipairs(list_of_lintes) do
        local ns = require('lint').get_namespace(linter_name)
        vim.diagnostic.config({
          virtual_text = false,
          signs = false,
        }, ns)
      end
    end

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require('lint').try_lint()
      end,
    })
  end,
}

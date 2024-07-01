return {
  'mfussenegger/nvim-lint',
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

    vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost' }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require('lint').try_lint()
      end,
    })
  end,
}

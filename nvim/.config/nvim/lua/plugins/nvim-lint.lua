return {
  "mfussenegger/nvim-lint",
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require("lint").linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "BufWritePost" }, {
      callback = function()
        -- do not run in floating windows
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
        if buftype == "nofile" then
          return
        end
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end,
}

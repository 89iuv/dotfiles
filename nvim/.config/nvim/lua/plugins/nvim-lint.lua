return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    }

    vim.api.nvim_create_autocmd({"BufEnter", "InsertLeave", "TextChanged", "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end,
}

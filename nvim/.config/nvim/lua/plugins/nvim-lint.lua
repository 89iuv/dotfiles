return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local languages = require("config.global").languages

    local linters_by_ft = {}
    for _, plugins in pairs(languages) do
      local nvim_lint = plugins.nvim_lint ~= nil and plugins.nvim_lint or {}
      linters_by_ft = vim.tbl_deep_extend("force", linters_by_ft, nvim_lint)
    end

    require("lint").linters_by_ft = linters_by_ft

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

return {
  "mistweaverco/kulala.nvim",
  opts = function()
    -- hide kulala ui buffer from buffer list
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*kulala_ui",
      callback = function()
        if vim.bo.filetype:find("kulala") then
          vim.bo.buflisted = false
        end
      end,
    })
    return {
      request_timeout = 30000,
      ui = {
        default_view = "headers_body",
        default_winbar_panes = { "body", "headers", "headers_body", "verbose", "help" },
      },
    }
  end,
}

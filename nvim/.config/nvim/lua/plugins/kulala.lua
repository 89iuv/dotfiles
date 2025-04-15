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
      default_view = "headers_body",
      ui = {
        winbar = false
      }
    }
  end,
}

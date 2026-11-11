return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local languages = require("config.global").languages

    local install = {}
    for _, plugins in pairs(languages) do
      local nvim_treesitter = plugins.nvim_treesitter ~= nil and plugins.nvim_treesitter or {}
      for _, parser in ipairs(nvim_treesitter) do
        table.insert(install, parser)
      end
    end

    require("nvim-treesitter").install(install)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}

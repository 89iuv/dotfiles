return {
  "lukas-reineke/virt-column.nvim",
  dependencies = {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle
        .new({
          name = "Line Column",
          get = function()
            return vim.g.virt_column
          end,
          set = function(state)
            vim.g.virt_column = state
            require("virt-column").update({ enabled = vim.g.virt_column })
          end,
        })
        :map("<leader>uu")
    end,
  },
  enabled = true,
  lazy = true,
  event = function()
    if vim.g.virt_column then
      return "BufEnter"
    end
  end,
  opts = function()
    return {
      enabled = vim.g.virt_column,
      char = { "┃", "│" },
      virtcolumn = "80,120",
      highlight = "VirtColumn",
    }
  end,
}

return {
  -- fix for: https://github.com/lukas-reineke/virt-column.nvim/issues/49
  -- "lukas-reineke/virt-column.nvim"
  "IronGeek/virt-column.nvim",
  branch = "fix/off-by-one",
  enabled = true,
  lazy = true,
  event = "BufEnter",
  opts = function()
    return {
      enabled = true,
      char = { "│", "│" },
      virtcolumn = "80,120",
      highlight = "VirtColumn",
      exclude = {
        filetypes = { "dashboard" },
      },
    }
  end,
}

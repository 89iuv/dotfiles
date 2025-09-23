return {
  "j-hui/fidget.nvim",
  lazy = true,
  event = "BufEnter",
  opts = {
    progress = {
      display = {
        done_icon = "✓",
      },
    },
    notification = {
      window = {
        border = "none",
        -- border = { "", "" ,"", " ", "", "", "", " " },
        normal_hl = "FidgetNormal",
        border_hl = "FidgetBorder",
        winblend = vim.o.winblend,
        x_padding = 0,
      },
    },
  },
}

return {
  "j-hui/fidget.nvim",
  lazy = true,
  event = "BufEnter",
  opts = {
    progress = {
      display = {
        done_icon = "󰸞",
      },
    },
    notification = {
      window = {
        border = "single",
        -- border = { "", "" ,"", " ", "", "", "", " " },
        normal_hl = "FidgetNormal",
        border_hl = "FidgetBorder",
        winblend = 0,
        x_padding = 0,
      },
    },
  },
}

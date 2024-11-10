return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      -- automatically configure lazygit to use the current colorscheme
      -- and integrate edit with the current neovim instance
      configure = false,
      win = {
        backdrop = 80,
        style = "lazygit",
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
        },
      },
    },
    notifier = {
      style = "fancy",
      margin = { top = 0, right = 0, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      top_down = true, -- place notifications from top to bottom
    },
    terminal = {
      win = {
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
        },
        style = "terminal",
      },
    },
  },
}

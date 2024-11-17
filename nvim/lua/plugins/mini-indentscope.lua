return {
  "echasnovski/mini.indentscope",
  version = false,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniStarterOpened",
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    -- Disable mini indentscope for unsuported buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "Trouble",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "trouble",
        "copilot-chat",
        "grug-far",
        "grug-far-help",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    -- set custom border in python for mini indent
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.b.miniindentscope_config = { options = { border = "top" } }
      end,
    })
  end,
  opts = {
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    },
    options = {
      border = "both",
      try_as_border = true,
    },
  },
}

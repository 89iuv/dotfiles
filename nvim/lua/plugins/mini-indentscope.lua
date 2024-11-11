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
  end,
  opts = {
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    },
    options = {
      border = "top",
      try_as_border = true,
    },
  },
}

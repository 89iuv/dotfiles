return {
  "mason-org/mason.nvim",
  keys = {
    { "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
  },
  config = function ()
    local border = require("config.global").border

    require("mason").setup({
      ui = {
        border = border,
        backdrop = 60,
        width = 0.8,
        height = 0.8,
      }
    })
  end
}

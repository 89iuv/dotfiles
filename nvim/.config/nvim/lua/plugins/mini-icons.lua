return {
  "echasnovski/mini.icons",
  version = false,   -- Use the main branch if you want the latest updates
  config = function()
    require("mini.icons").setup({
    })
    require("mini.icons").mock_nvim_web_devicons()
  end,
}

return {
  "nvzone/showkeys",
  dependencies = {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle
        .new({
          name = "Show Keys",
          get = function()
            return require("showkeys.state").visible
          end,
          set = function(state)
            if state then
              require("showkeys").open()
            else
              require("showkeys").close()
            end
          end,
        })
        :map("<leader>uk")
    end,
  },
  lazy = true,
  event = function()
    if vim.g.showkeys then
      return "BufEnter"
    end
  end,
  config = function()
    require("showkeys").setup({
      timeout = 5,
      maxkeys = 8,
      show_count = true,
      position = "bottom-center",
      winhl = "FloatBorder:FloatBorder,Normal:NormalFloat",
    })
    if vim.g.showkeys then
      require("showkeys").open()
    end
  end,
}

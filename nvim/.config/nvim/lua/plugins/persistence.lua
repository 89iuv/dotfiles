return {
  "folke/persistence.nvim",
  opts = {
    options = {--[[<other options>,]]
      "globals",
    },
    pre_save = function()
      vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
    end,
  },
}

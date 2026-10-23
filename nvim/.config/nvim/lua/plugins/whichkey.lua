return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.icons" },
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      spec = {
        { "<leader>e", desc = "Explorer", icon = MiniIcons.get("default", "directory") },
        { "<leader>b", desc = "Buffer" },
        { "<leader>f", desc = "Find" },
        {
          "<leader>w",
          function()
            require("which-key").show({
              loop = false,
              keys = "<c-w>"
            })
          end,
          desc = "Window Hydra Mode"
        },
        {
          "<leader>W",
          function()
            require("which-key").show({
              loop = true,
              keys = "<c-w>"
            })
          end,
          desc = "Window Hydra Mode"
        },
      },
      preset = "helix",
      win = {
        border = "single",
      },
    })
  end,
}

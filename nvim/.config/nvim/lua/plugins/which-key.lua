return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.icons" },
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      spec = {
        { "gr", desc = "Lsp", icon = "" },
        { "<leader>b", desc = "Buffer" },
        { "<leader>c", desc = "Code", mode = { "n", "x" } },
        { "<leader>e", desc = "Explorer", icon = "󰉋 " },
        { "<leader>h", desc = "Hunk", icon = "", mode = { "n", "x" } },
        { "<leader>g", desc = "Git", icon = "󰊢", mode = { "n", "x" } },
        { "<leader>f", desc = "Find" },
        { "<leader>s", desc = "Search", mode = { "n", "v" } },
        { "<leader>t", desc = "Toggle" },
        {
          "<leader>w",
          function()
            require("which-key").show({
              loop = false,
              keys = "<c-w>",
            })
          end,
          desc = "Window",
        },
        {
          "<leader>W",
          function()
            require("which-key").show({
              loop = true,
              keys = "<c-w>",
            })
          end,
          desc = "Window Hydra Mode",
        },
        { "<leader>x", desc = "Trouble", icon = "󰙅" },
      },
      preset = "helix",
      delay = 350,
      win = {
        border = "single",
      },
    })
  end,
}

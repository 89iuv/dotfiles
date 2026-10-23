return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" }
  },
  config = function()
    require("fzf-lua").setup({
      fzf_colors = true,
      winopts = {
        backdrop = 100,
        border = "single",
        preview = {
          border = "single"
        }
      },
      files = {
        cwd_prompt = false,
      }
    })
  end,
}


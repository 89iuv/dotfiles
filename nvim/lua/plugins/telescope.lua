return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fs",
      "<cmd>Telescope spell_suggest<cr>",
      desc = "Find Spell Suggestions",
    },
  },
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
    },
  },
}

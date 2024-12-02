return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sz",
      "<cmd>Telescope spell_suggest<cr>",
      desc = "Spell Suggestions",
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

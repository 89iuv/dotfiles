return {
  "sphamba/smear-cursor.nvim",
  enabled = vim.g.snacks_animate,
  opts = {
    hide_target_hack = false,
    cursor_color = "none",

    never_draw_over_target = true,
    legacy_computing_symbols_support = true,

    smear_terminal_mode = false,
    smear_insert_mode = false,

    delay_event_to_smear = 10,

    stiffness = 0.7,
    trailing_stiffness = 0.3,
    max_length = 50,
  },
}

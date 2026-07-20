vim.pack.add({
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
})

require("smear_cursor").setup({
  hide_target_hack = false,
  cursor_color = "none",

  never_draw_over_target = false,
  legacy_computing_symbols_support = false,

  smear_insert_mode = false,
  smear_terminal_mode = false,
  smear_to_cmd = true,

  delay_event_to_smear = (1000 / 60 / 2),
  time_interval = 1000 / 60,

  stiffness = 0.6,
  trailing_stiffness = 0.4,
  anticipation = 0.2,
  damping = 0.8,

  max_length = 25,
})

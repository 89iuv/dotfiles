return {
  "sphamba/smear-cursor.nvim",
  enabled = true,
  opts = function()
    local smear_cursor = require("smear_cursor")

    -- Disable when entering visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\x16]",
      callback = function()
        smear_cursor.enabled = false
      end,
    })

    -- Enable when leaving visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "[vV\x16]:*",
      callback = function()
        smear_cursor.enabled = true
      end,
    })

    return {
      delay_after_key = 100,

      hide_target_hack = false,
      cursor_color = "none",

      never_draw_over_target = false,
      legacy_computing_symbols_support = false,

      smear_insert_mode = false,
      smear_terminal_mode = true,
      smear_to_cmd = true,

      filetypes_disabled = { "snacks_terminal" }
    }
  end,
}

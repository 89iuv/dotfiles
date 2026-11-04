return {
  'saghen/blink.indent',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    blocked = {
      buftypes = { include_defaults = true },
      filetypes = { include_defaults = true,  "markdown", "snacks_dashboard", "snacks_picker_preview", "markdown.snacks_picker_preview" },
    },
    static = {
      enabled = true,
      char = '│',
      highlights = { 'BlinkIndent' },
    },
    scope = {
      enabled = true,          -- highlight highest level of indentation on the current line
      indent_at_cursor = false, -- clamp to indent level of cursor
      char = '│',
      highlights = { 'BlinkIndentScope' }
    },
  },
}

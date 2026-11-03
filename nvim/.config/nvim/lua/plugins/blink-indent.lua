return {
  'saghen/blink.indent',
  opts = {
    blocked = {
      buftypes = { include_defaults = true },
      filetypes = { include_defaults = true, "dashboard", "markdown", "snacks_picker_preview", "markdown.snacks_picker_preview" },
    },
    static = {
      enabled = true,
      char = '│',
      highlights = { 'BlinkIndent' },
    },
    scope = {
      enabled = true,          -- highlight highest level of indentation on the current line
      indent_at_cursor = true, -- clamp to indent level of cursor
      char = '│',
      highlights = { 'BlinkIndentScope' }
    },
  },
}

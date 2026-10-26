return {
  'saghen/blink.indent',
  opts = {
    blocked = {
      buftypes = { include_defaults = true },
      filetypes = { include_defaults = true },
    },
    static = {
      enabled = true,
      char = '▏',
      highlights = { 'BlinkIndent' },
    },
    scope = {
      enabled = true,          -- highlight highest level of indentation on the current line
      indent_at_cursor = false, -- clamp to indent level of cursor
      char = '▏',
      highlights = { 'BlinkIndentScope' }
    },
  },
}

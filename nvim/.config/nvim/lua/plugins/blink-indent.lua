return {
  'saghen/blink.indent',
  opts = {
    blocked = {
      -- default: 'terminal', 'quickfix', 'nofile', 'prompt'
      -- buftypes = { 'terminal', 'quickfix', 'prompt' },
      buftypes = { include_defaults = true },
      -- default: 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'gitcommit', 'dashboard', ''
      -- filetypes = { 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'gitcommit', 'dashboard' },
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

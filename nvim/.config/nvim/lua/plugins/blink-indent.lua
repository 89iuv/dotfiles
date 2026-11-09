return {
  "saghen/blink.indent",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local blocked = {
      buftypes = { include_defaults = true },
      filetypes = { include_defaults = true, "text", "markdown" },
    }

    local ignore = require("config.global").exclude
    for _, filetype in ipairs(ignore.filetypes) do
      table.insert(blocked.filetypes, filetype)
    end

    require("blink-indent").setup({
      blocked = blocked,
      dedent_scoped_filetypes = { include_defaults = true, "dockerfile" },
      static = {
        enabled = true,
        char = "│",
        highlights = { "BlinkIndent" },
      },
      scope = {
        enabled = true, -- highlight highest level of indentation on the current line
        indent_at_cursor = false, -- clamp to indent level of cursor
        char = "│",
        highlights = { "BlinkIndentScope" },
      },
    })
  end,
}

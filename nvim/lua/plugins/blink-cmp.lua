return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "," },
      },
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = false,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
    },
  },
}

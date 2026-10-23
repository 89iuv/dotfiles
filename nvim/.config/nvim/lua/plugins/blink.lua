return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    cmdline = {
      enabled = false,
    },

    keymap = {
      preset = "default",
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
      ["<CR>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "fallback",
      },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      menu = {
        border = "single",
        winblend = 0,
        draw = {
          columns = {
            { "label", "label_description", "source_name", gap = 1 },
            { "kind_icon" },
            { "kind" },
          },
          components = {
            source_name = {
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = false,
        window = {
          border = "single",
          winblend = 0,
        },
      },
      list = {
        selection = {
          auto_insert = false,
        },
      },
      ghost_text = {
        enabled = false,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

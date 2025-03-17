return {
  "saghen/blink.cmp",
  opts = {
    appearance = {
      nerd_font_variant = "mono", -- mono | normal
    },
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
      },
      menu = {
        border = "single",
        draw = {
          columns = {
            { "label", "label_description", "source_name", gap = 1 },
            { "kind_icon", "kind" },
          },
          components = {
            source_name = {
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
            },
          },
          treesitter = {},
        },
      },
      documentation = {
        auto_show = false,
        window = {
          border = "single",
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
      providers = {
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= "trigger_character"
          end,
        },
      },
    },
    fuzzy = {
      max_typos = function(_)
        return 0
      end,
      use_frecency = true,
      use_proximity = true,
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
    keymap = {
      preset = "super-tab",
      ["<CR>"] = { "accept", "fallback" },
    },
    signature = {
      enabled = false,
      trigger = {
        show_on_keyword = true,
      },
      window = {
        border = "single",
        show_documentation = false,
      },
    },
  },
}

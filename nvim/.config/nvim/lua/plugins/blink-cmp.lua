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
        border = vim.g.border,
        winblend = vim.o.winblend,
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
          border = vim.g.border,
          winblend = vim.o.winblend,
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
      -- TODO: remove this once the rust binary is downloaded in headless
      implementation = "lua",
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
    signature = {
      enabled = true,
      window = {
        border = vim.g.border,
        winblend = vim.o.winblend,
        show_documentation = false,
      },
    },
  },
}

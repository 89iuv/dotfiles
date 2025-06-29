return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype)
    end,
    appearance = {
      nerd_font_variant = "normal", -- mono | normal
    },
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
      },
      menu = {
        border = require("config.global").border,
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
          border = require("config.global").border,
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
      ["<C-k>"] = { "fallback" }, -- used in insert mode navigation ctrl+hjkl
      ["<M-p>"] = { "show_signature", "hide_signature", "fallback" },
    },
    signature = {
      enabled = true,
      window = {
        border = require("config.global").border,
        show_documentation = false,
      },
    },
  },
}

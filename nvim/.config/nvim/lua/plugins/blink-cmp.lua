return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
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
      default = function()
        -- put those which will be shown always
        local result = { "lsp", "path", "snippets", "buffer" }
        if vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype) then
          table.insert(result, "dictionary")
        end
        return result
      end,
      per_filetype = {
        markdown = { inherit_defaults = true, "dictionary" },
      },
      providers = {
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= "trigger_character"
          end,
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dictionary",
          min_keyword_length = 3,
          score_offset = -10, -- Boost/penalize the score of the items
          opts = {
            dictionary_files = { vim.fn.expand("$HOME/.nix-profile/share/dict/words.txt") },
          },
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

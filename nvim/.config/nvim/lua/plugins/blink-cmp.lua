-- use this function to check if the cursor is inside a comment block
local function inside_comment_block()
  if vim.api.nvim_get_mode().mode ~= "i" then
    return false
  end
  local node_under_cursor = vim.treesitter.get_node()
  if not node_under_cursor then
    return false
  end
  local parser = vim.treesitter.get_parser(nil, nil, { error = false })
  if not parser then
    return false
  end
  local query = vim.treesitter.query.get(vim.bo.filetype, "highlights")
  if not query then
    return false
  end
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1
  for id, node, _ in query:iter_captures(node_under_cursor, 0, row, row + 1) do
    if query.captures[id]:find("comment") then
      local start_row, start_col, end_row, end_col = node:range()
      if start_row <= row and row <= end_row then
        if start_row == row and end_row == row then
          if start_col <= col and col <= end_col then
            return true
          end
        elseif start_row == row then
          if start_col <= col then
            return true
          end
        elseif end_row == row then
          if col <= end_col then
            return true
          end
        else
          return true
        end
      end
    end
  end
  return false
end

return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
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
        local result = { "copilot", "lsp", "path", "snippets", "buffer" }
        if
          -- turn on dictionary in markdown or text file
          vim.tbl_contains({ "markdown" }, vim.bo.filetype)
          -- or turn on dictionary if cursor is in the comment block
          or inside_comment_block()
        then
          table.insert(result, "dictionary")
        end
        return result
      end,
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
          score_offset = -10, -- boost/penalize the score of the items
          opts = {
            dictionary_files = {
              vim.fn.expand("$HOME/.nix-profile/share/dict/words.txt"),
              vim.fn.expand("$HOME/.config/harper/words.txt"),
            },
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

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "uga-rosa/cmp-dictionary",
        opts = {
          paths = { "/usr/share/dict/words" },
          exact_length = 0,
        },
      },
    },

    init = function()
      vim.opt.pumblend = 0 -- disable cmp menu transparency
    end,

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping = vim.tbl_extend(
        "force",
        opts.mapping,
        cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if cmp.visible_docs() then
                cmp.close_docs()
              else
                cmp.open_docs()
              end
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      )

      ---@diagnostic disable-next-line: missing-fields
      opts.formatting = {
        format = function(entry, item)
          local icons = LazyVim.config.icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
            end
          end

          item.menu = "[" .. entry.source.name .. "]"

          return item
        end,
      }

      opts.sources = {
        { name = "path", priority = 100, group_index = 1, keyword_length = 1 },
        { name = "nvim_lsp", priority = 100, group_index = 1, keyword_length = 1 },
        { name = "luasnip", priority = 50, group_index = 1, keyword_length = 1 },
        { name = "buffer", priority = 10, group_index = 2, keyword_length = 1 },
        { name = "dictionary", priority = 5, group_index = 3, keyword_length = 3 },
      }

      -- Custom comparator to sort by source priority
      local source_comparator = function(entry1, entry2)
        local get_source_priority = function(name)
          local priority = 0
          for _, source in ipairs(opts.sources) do
            if source.name == name then
              priority = source.priority
              break
            end
          end
          return priority
        end

        local kind1 = get_source_priority(entry1.source.name)
        local kind2 = get_source_priority(entry2.source.name)

        if kind1 == kind2 then
          return nil
        end

        return kind1 > kind2
      end

      opts.sorting = {
        priority_weight = 2,
        comparators = {
          source_comparator,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }

      opts.view = {
        docs = {
          auto_open = false,
        },
      }

      opts.window = {
        documentation = {
          border = "none",
        },
      }
      opts.experimental.ghost_text = false
    end,
  },
}

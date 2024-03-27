return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },

    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    {
      'zbirenbaum/copilot.lua',
      event = 'InsertEnter',
      opts = {
        -- Possible configurable fields can be found on:
        -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = true,
          auto_refresh = true,
          layout = {
            position = 'right', -- | top | left | right
            ratio = 0.4,
          },
        },
      },
    },
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
      },

      experimental = {
        ghost_text = false, -- this feature conflict with copilot.vim's preview.
      },

      window = {
        completion = {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat',
        },
        documentation = {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat',
        },
      },

      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          local kind = require('lspkind').cmp_format {
            mode = 'symbol_text',
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            symbol_map = { Copilot = '' },
            menu = {
              copilot = 'Copilot',
              nvim_lsp = 'NvimLSP',
              luasnip = 'LuaSnip',
              buffer = 'Buffer',
              path = 'Path',
            },
          }(entry, vim_item)

          local strings = vim.split(kind.kind, '%s', { trimempty = true })
          kind.kind = ' ' .. (strings[1] or '') .. ' '
          -- kind.menu = '    ' .. kind.menu .. ' - ' .. (strings[2] or '') .. ''
          kind.menu = '    [' .. kind.menu .. ']'

          return kind
        end,
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      sources = {
        { name = 'nvim_lsp', max_item_count = 16, priority = 100 },
        { name = 'copilot', max_item_count = 4, priority = 50 },
        { name = 'luasnip', max_item_count = 4, priority = 40 },
        { name = 'buffer', max_item_count = 8, priority = 30 },
        { name = 'path', max_item_count = 4, priority = 20 },
      },

      sorting = {
        priority_weight = 2,
        comparators = {
          -- require('copilot_cmp.comparators').prioritize,

          -- Below is the default comparitor list and order for nvim-cmp
          require('cmp').config.compare.offset,
          -- require("cmp").config.compare.scopes, --this is commented in nvim-cmp too
          require('cmp').config.compare.exact,
          require('cmp').config.compare.score,
          require('cmp').config.compare.recently_used,
          require('cmp').config.compare.locality,
          require('cmp').config.compare.kind,
          require('cmp').config.compare.sort_text,
          require('cmp').config.compare.length,
          require('cmp').config.compare.order,
        },
      },
    }
  end,
}

local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
       mode = 'symbol_text',
       menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          buffer = "[Buffer]",
          path = "[Path]",
       })
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 10},
    { name = 'luasnip', max_item_count = 10}, -- For luasnip users.
    { name = 'buffer', max_item_count = 10},
    { name = 'path', max_item_count = 10},
  })
})

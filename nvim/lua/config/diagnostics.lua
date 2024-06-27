-- Diagnostics config
vim.diagnostic.config {
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
    source = true,
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
}

-- Diagnostics change the sign simbol in the gutter
local signs = { Error = ' ', Warn = ' ', Hint = '', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = '', linehl = '', numhl = '' })
end

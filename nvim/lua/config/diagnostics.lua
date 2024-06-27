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
  vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = '', numhl = '' })
end

local ns = vim.api.nvim_create_namespace 'global_lsp_namespace'

local orig_handler_virtual_text = vim.diagnostic.handlers.virtual_text
vim.diagnostic.handlers.virtual_text = {
  show = function(_, bufnr, _, opts)
    local diagnostics = vim.deepcopy(vim.diagnostic.get(bufnr), true)

    table.sort(diagnostics, function(a, b)
      return a.severity > b.severity
    end)

    orig_handler_virtual_text.show(ns, bufnr, diagnostics, opts)
  end,

  hide = function(_, bufnr)
    orig_handler_virtual_text.hide(ns, bufnr)
  end,
}

local orig_handler_underline = vim.diagnostic.handlers.underline
vim.diagnostic.handlers.underline = {
  show = function(_, bufnr, _, opts)
    local diagnostics = vim.deepcopy(vim.diagnostic.get(bufnr), true)

    table.sort(diagnostics, function(a, b)
      if a.severity == b.severity then
        return a.end_col - a.col > b.end_col - b.col
      end

      return a.severity < b.severity
    end)

    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or (d.severity <= m.severity and d.end_col - d.col > m.end_col - m.col) then
        max_severity_per_line[d.lnum] = d
      end
    end

    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_handler_underline.show(ns, bufnr, filtered_diagnostics, opts)
  end,

  hide = function(_, bufnr)
    orig_handler_underline.hide(ns, bufnr)
  end,
}

local orig_handler_signs = vim.diagnostic.handlers.signs
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    local diagnostics = vim.deepcopy(vim.diagnostic.get(bufnr))

    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_handler_signs.show(ns, bufnr, filtered_diagnostics, opts)
  end,

  hide = function(_, bufnr)
    orig_handler_signs.hide(ns, bufnr)
  end,
}

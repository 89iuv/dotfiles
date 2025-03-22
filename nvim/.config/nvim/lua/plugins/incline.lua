return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      margin = {
        horizontal = 0,
        vertical = 2,
      },
    },
    render = function(props)
      local function get_diagnostic_label()
        local icons = LazyVim.config.icons.diagnostics
        local label = {}

        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
          end
        end
        if #label > 0 then
          table.insert(label, { "| " })
        end
        return label
      end

      local function get_lsp_label()
        local clients = vim.lsp.get_clients({bufnr = props.buf})

        local lsp_label = ""
        for _, client in ipairs(clients) do
          lsp_label = lsp_label .. "󰅡 " .. client.name .. "  "
        end

        return vim.trim(lsp_label)
      end

      return {
        { get_diagnostic_label() },
        { get_lsp_label() },
      }
    end,
  },
}

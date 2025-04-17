return {
  "b0o/incline.nvim",
  event = "BufEnter",
  opts = function()
    local incline = require("incline")

    Snacks.toggle
      .new({
        name = "Incline",
        get = incline.is_enabled,
        set = incline.toggle,
      })
      :map("<leader>ue")

    local opts = {
      hide = {
        cursorline = "focused_win",
      },
      window = {
        margin = {
          horizontal = 0,
          vertical = 2,
        },
        zindex = 10,
      },
      render = function(props)
        local function get_diagnostic_label(namespace)
          local icons = LazyVim.config.icons.diagnostics
          local priority = {
            DiagnosticSignError = 1,
            DiagnosticSignWarn = 2,
            DiagnosticSignInfo = 3,
            DiagnosticSignHint = 4,
          }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, {
              namespace = namespace,
              severity = vim.diagnostic.severity[string.upper(severity)],
            })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end

          table.sort(label, function(a, b)
            return priority[a["group"]] > priority[b["group"]]
          end)

          return label
        end

        local function get_code_table()
          local code_table = {}

          -- lsp diagnostics and client name
          local clients = vim.lsp.get_clients({ bufnr = props.buf })
          table.sort(clients, function(a, b)
            return a.name < b.name
          end)

          for _, client in ipairs(clients) do
            local lsp_client = {}
            local pull_namespace = vim.lsp.diagnostic.get_namespace(client.id, true)
            local push_namespace = vim.lsp.diagnostic.get_namespace(client.id, false)
            table.insert(lsp_client, get_diagnostic_label(pull_namespace))
            table.insert(lsp_client, get_diagnostic_label(push_namespace))
            table.insert(lsp_client, { "󰒓 " .. client.name })

            table.insert(code_table, lsp_client)
          end

          -- code formater name
          local conform = require("conform")
          local formaters = conform.list_formatters_to_run(props.buf)

          table.sort(formaters, function(a, b)
            return a.name < b.name
          end)

          for _, formater in ipairs(formaters) do
            local formater_client = {}
            table.insert(formater_client, { "󰏫 " .. formater.name })

            table.insert(code_table, formater_client)
          end

          local code_table_formated = {}
          for index, code in ipairs(code_table) do
            if index ~= 1 then
              table.insert(code_table_formated, { " │ " })
            end

            table.insert(code_table_formated, code)
          end

          return code_table_formated
        end

        return {
          get_code_table(),
        }
      end,
    }

    return opts
  end,
}

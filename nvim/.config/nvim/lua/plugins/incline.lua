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
        options = {
          winblend = 0,
        },
        margin = {
          horizontal = 0,
          vertical = 2,
        },
        zindex = 10,
      },

      render = function(props)
        local opts = {
          icons = {
            diagnostics = "󰒔 ",
            linters = "󰸫 ",
            formaters = "󰿠 ",
          },
          separator = {
            module = "  ",
            group = " │ ",
          }
        }

        local function insert_separator(tbl, sep, gr)
          local table_formated = {}
          for index, item in ipairs(tbl) do
            if index ~= 1 then
              table.insert(table_formated, { sep, group = gr })
            end

            table.insert(table_formated, item)
          end

          return table_formated
        end

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

          local diagnostic_group = {}
          for _, client in ipairs(clients) do
            local lsp_client = {}
            local pull_namespace = vim.lsp.diagnostic.get_namespace(client.id, true)
            local push_namespace = vim.lsp.diagnostic.get_namespace(client.id, false)
            table.insert(lsp_client, get_diagnostic_label(pull_namespace))
            table.insert(lsp_client, get_diagnostic_label(push_namespace))
            table.insert(lsp_client, { opts.icons.diagnostics .. client.name })

            table.insert(diagnostic_group, lsp_client)
          end
          diagnostic_group = insert_separator(diagnostic_group, opts.separator.module, "InclineSeparator")
          if #diagnostic_group > 0 then
            table.insert(code_table, diagnostic_group)
          end

          -- code linter name
          local linters = require("lint").linters_by_ft[vim.bo[props.buf].filetype]
          linters = linters ~= nil and linters or {}

          table.sort(linters, function(a, b)
            return a < b
          end)

          local linter_group = {}
          for _, linter in ipairs(linters) do
            local linter_client = {}
            local ns = require("lint").get_namespace(linter)
            table.insert(linter_client, get_diagnostic_label(ns))
            table.insert(linter_client, { opts.icons.linters .. linter })

            table.insert(linter_group, linter_client)
          end
          linter_group = insert_separator(linter_group, opts.separator.module, "InclineSeparator")
          if #linter_group > 0 then
            table.insert(code_table, linter_group)
          end

          -- code formater name
          local conform = require("conform")
          local formaters = conform.list_formatters_to_run(props.buf)

          table.sort(formaters, function(a, b)
            return a.name < b.name
          end)

          local formater_group = {}
          for _, formater in ipairs(formaters) do
            local formater_client = {}
            table.insert(formater_client, { opts.icons.formaters .. formater.name })

            table.insert(formater_group, formater_client)
          end
          formater_group = insert_separator(formater_group, opts.separator.module, "InclineSeparator")
          if #formater_group > 0 then
            table.insert(code_table, formater_group)
          end

          local code_table_formated = insert_separator(code_table, opts.separator.group, "InclineSeparator")
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

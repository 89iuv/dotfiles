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
      },
      render = function(props)
        local function get_diagnostic_label()
          local icons = LazyVim.config.icons.diagnostics
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, {
              severity = vim.diagnostic.severity[string.upper(severity)],
            })
            if n > 0 then
              table.insert(label, 1, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          return label
        end

        local function get_lsp_label()
          local clients = vim.lsp.get_clients({ bufnr = props.buf })

          local lsp_table = {}
          for _, client in ipairs(clients) do
            table.insert(lsp_table, "󰒓 " .. client.name)
          end

          table.sort(lsp_table)
          local lsp_label = table.concat(lsp_table, " ")

          return vim.trim(lsp_label)
        end

        local function get_formater_label()
          local conform = require("conform")
          local formaters = conform.list_formatters_to_run(props.buf)

          local formaters_table = {}
          for _, formater in ipairs(formaters) do
            table.insert(formaters_table, "󰏫 " .. formater.name)
          end

          table.sort(formaters_table)
          local formaters_label = table.concat(formaters_table, " ")

          return formaters_label
        end

        local get_code_label = function()
          local code_helpers = {}
          table.insert(code_helpers, get_lsp_label())
          table.insert(code_helpers, get_formater_label())

          -- clean up table
          local filtered_code_helpers = {}
          for _, helper in ipairs(code_helpers) do
            if helper ~= "" then
              table.insert(filtered_code_helpers, helper)
            end
          end

          return table.concat(filtered_code_helpers, " │ ")
        end

        return {
          { get_diagnostic_label() },
          { get_code_label() },
        }
      end,
    }

    return opts
  end,
}

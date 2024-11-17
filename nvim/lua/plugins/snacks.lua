return {
  "folke/snacks.nvim",
  init = function()
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
          return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 0,
                value.title or "",
                value.message
                    and value.title
                    and not string.find(value.message, value.title)
                    and (" **%s**"):format(value.message)
                  or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
          return table.insert(msg, v.msg) or not v.done
        end, p)

        vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
          id = "lsp_progress",
          title = client.name,
        })
      end,
    })
  end,
  opts = {
    lazygit = {
      configure = false,
      win = {
        height = 0.9,
        backdrop = 80,
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
        },
        keys = {
          q = "close",
          ["<esc>"] = "close",
        },
      },
    },
    notifier = {
      level = vim.log.levels.TRACE,
      style = "fancy",
      margin = { top = 0, right = 0, bottom = 0 },
      top_down = false,
    },
    terminal = {
      win = {
        height = 20,
        wo = {
          winbar = "",
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
        },
        keys = {
          q = "close",
          ["<esc>"] = "close",
        },
      },
    },
    styles = {
      notification = {
        wo = {
          winblend = 0,
          wrap = true,
        },
      },
    },
  },
}

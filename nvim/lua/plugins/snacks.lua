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
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
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

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
              or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
  opts = {
    lazygit = {
      -- automatically configure lazygit to use the current colorscheme
      -- and integrate edit with the current neovim instance
      configure = false,
      win = {
        backdrop = 80,
        style = "lazygit",
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC",
        },
      },
    },
    notifier = {
      style = "fancy",
      margin = { top = 0, right = 0, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      top_down = true, -- place notifications from top to bottom
    },
    terminal = {
      win = {
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
        },
        style = "terminal",
      },
    },
  },
}

return {
  "folke/snacks.nvim",
  init = function()
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client and client.name == "jdtls" then
          if
            string.find(ev.data.params.value.message, "Validate documents")
            or string.find(ev.data.params.value.message, "Publish Diagnostics")
          then
            return
          end
        end

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

        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
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
        keys = {
          q = "close",
          ["<esc>"] = "close",
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
        style = "terminal",
        wo = {
          winhighlight = "Normal:Normal,NormalNC:NormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
        },
        keys = {
          q = "close",
          ["<esc>"] = "close",
        },
      },
    },
  },
}

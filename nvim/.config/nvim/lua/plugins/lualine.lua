return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "mfussenegger/nvim-lint",
    "stevearc/conform.nvim",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    local git_state = { branch = "", dirty = false, ahead = 0, behind = 0 }

    local function refresh_git()
      vim.system(
        { "git", "status", "--porcelain=v2", "--branch" },
        { text = true, cwd = vim.fn.getcwd() },
        function(res)
          local s = { branch = "", dirty = false, ahead = 0, behind = 0 }
          if res.code == 0 then
            for line in res.stdout:gmatch("[^\n]+") do
              local head = line:match("^# branch%.head (.+)")
              if head then
                s.branch = head
              else
                local a, b = line:match("^# branch%.ab %+(%d+) %-(%d+)")
                if a then
                  s.ahead, s.behind = tonumber(a), tonumber(b)
                elseif line:sub(1, 1) ~= "#" then
                  s.dirty = true
                end
              end
            end
          end
          git_state = s
          vim.schedule(function()
            require("lualine").refresh()
          end)
        end
      )
    end

    vim.api.nvim_create_autocmd(
      { "VimEnter", "BufEnter", "BufWritePost", "FocusGained", "DirChanged", "ShellCmdPost" },
      { callback = refresh_git }
    )

    local function branch()
      if git_state.branch == "" then
        return ""
      end
      local out = git_state.branch
      if git_state.dirty then
        out = out .. "*"
      end
      if git_state.behind > 0 then
        out = out .. " ↓" .. git_state.behind
      end
      if git_state.ahead > 0 then
        out = out .. " ↑" .. git_state.ahead
      end
      return out
    end

    require("lualine").setup({
      options = {
        theme = "catppuccin-nvim",
        component_separators = { left = "╱", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
        },
      },
      extensions = { "neo-tree", "fzf" },
      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },
        lualine_b = {
          {
            branch,
            icon = "󰘬",
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_workspace_diagnostic" },
            colored = false,
            symbols = {
              error = require("config.global").icons.diagnostics_outline.error .. " ",
              warn = require("config.global").icons.diagnostics_outline.warn .. " ",
              info = require("config.global").icons.diagnostics_outline.info .. " ",
              hint = require("config.global").icons.diagnostics_outline.hint .. " ",
            },
            always_visible = true,
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_x = {
          {
            function()
              local line = vim.fn.line(".")
              local lines = vim.api.nvim_buf_line_count(0)

              local col = vim.fn.charcol(".")
              local cols = vim.api.nvim_win_get_width(0)

              return string.format("Ln %0" .. #tostring(lines) .. "d, Col %0" .. #tostring(cols) .. "d", line, col)
            end,
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {
          {
            function()
              return "Spaces:" .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
            end,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            "encoding",
            fmt = string.upper,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = true,
            symbols = {
              unix = "lf",
              dos = "crlf",
              mac = "cr",
            },
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_z = {
          {
            "filetype",
            colored = false,
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
      },
    })
  end,
}

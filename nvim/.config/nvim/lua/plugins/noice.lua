-- HACK: workaround for https://github.com/folke/noice.nvim/issues/679
local customize_incsearch_for_noice = function()
  local ns = vim.api.nvim_create_namespace("noice-incsearch-ns")
  local group = vim.api.nvim_create_augroup("noice-incsearch-group", {})
  local start_pos = nil
  local top_line = nil
  local matches = {}
  local cur_idx = 1
  local pat = ""
  local search_cmds = { ["/"] = true, ["?"] = true }
  local search_cmd = nil
  local accept = false
  local is_noice_running = require("noice.config").is_running

  vim.keymap.set("c", "<cr>", function()
    if search_cmd then
      accept = true
    end
    return "<cr>"
  end, { noremap = false, expr = true })

  local function get_matches(pattern)
    if pattern == "" then
      return {}
    end
    local result = {}
    local save_pos = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_win_set_cursor(0, { 1, 0 })

    while true do
      local pos = vim.fn.searchpos(pattern, "W")
      local row, col = pos[1], pos[2]
      if row == 0 then
        break
      end
      table.insert(result, { row, col - 1 })
      if not pcall(vim.api.nvim_win_set_cursor, 0, { row, col }) then
        break
      end
      vim.api.nvim_win_set_cursor(0, { row, col })
    end

    vim.api.nvim_win_set_cursor(0, save_pos)
    return result
  end

  local function match_index()
    local best_match_idx = nil

    if search_cmd == "/" then
      for i, match in ipairs(matches) do
        local m_row, m_col = match[1], match[2]
        if m_row > start_pos[1] or (m_row == start_pos[1] and m_col >= start_pos[2]) then
          best_match_idx = i
          break
        end
      end
      if best_match_idx == nil then
        best_match_idx = 1
      end
    elseif search_cmd == "?" then
      for i = #matches, 1, -1 do
        local match = matches[i]
        local m_row, m_col = match[1], match[2]
        if m_row < start_pos[1] or (m_row == start_pos[1] and m_col < start_pos[2]) then
          best_match_idx = i
          break
        end
      end
      if best_match_idx == nil then
        best_match_idx = #matches
      end
    end

    return best_match_idx
  end

  local function highlight()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    for i, match in ipairs(matches) do
      local hl = (i == cur_idx) and "IncSearch" or "Search"
      vim.api.nvim_buf_set_extmark(0, ns, match[1] - 1, match[2], { hl_group = hl, end_col = match[2] + #pat })
    end
  end

  local function jump()
    local match = matches[cur_idx]
    if match then
      vim.api.nvim_win_set_cursor(0, { top_line, 0 })
      vim.cmd("normal! zt")
      vim.api.nvim_win_set_cursor(0, { match[1], match[2] })
    end
  end

  local function jump_final()
    if not accept then
      vim.api.nvim_win_set_cursor(0, start_pos)
      return
    end
    local match = matches[cur_idx]
    if match then
      local line = match[1]
      local col = match[2]
      if #matches > 1 then
        if search_cmd == "/" then
          if col == 0 and line ~= 0 then
            line = line - 1
          else
            col = col - 1
          end
        elseif search_cmd == "?" then
          if col ~= #vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] then
            col = col + 1
          else
            if line + 1 <= vim.api.nvim_buf_line_count(0) then
              line = line + 1
            else
              line = 1
            end
            col = 0
          end
        end
      end
      vim.api.nvim_win_set_cursor(0, { top_line, 0 })
      vim.cmd("normal! zt")
      vim.api.nvim_win_set_cursor(0, { line, col })
    end
  end

  vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = group,
    pattern = "/,?",
    callback = function()
      local cmd_type = vim.fn.getcmdtype()
      if search_cmds[cmd_type] == nil or not is_noice_running() then
        return
      end
      if vim.o.incsearch == false then
        return
      end
      vim.o.incsearch = false
      start_pos = vim.api.nvim_win_get_cursor(0)
      top_line = vim.fn.line("w0")
      accept = false
      matches = {}
      cur_idx = 1
      pat = ""
      search_cmd = cmd_type
    end,
  })

  vim.api.nvim_create_autocmd("CmdlineChanged", {
    group = group,
    pattern = "/,?",
    callback = function()
      if not search_cmd then
        return
      end
      pat = vim.fn.getcmdline()
      vim.fn.setreg("/", pat)

      matches = get_matches(pat)
      if #matches == 0 then
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
        return
      end

      cur_idx = match_index()
      jump()

      highlight()
    end,
  })

  vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = group,
    pattern = "/,?",
    callback = function()
      if not search_cmd then
        return
      end
      vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
      jump_final()
      start_pos = nil
      top_line = nil
      accept = false
      matches = {}
      vim.o.incsearch = true
      search_cmd = nil
    end,
  })
end

return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local new_opts = {
      presets = {
        command_palette = {
          views = {
            cmdline_popupmenu = {
              border = {
                style = vim.g.border,
              },
            },
          },
        },
        bottom_search = false,
        lsp_doc_border = {
          views = {
            hover = {
              border = {
                style = vim.g.border,
              },
            },
          },
        },
      },
      lsp = {
        progress = {
          format = {
            {
              "{progress} ",
              key = "progress.percentage",
              contents = {
                { "{data.progress.message} " },
              },
            },
            { "({data.progress.percentage}%) ", hl_group = "NoiceLspProgressTitle" },
            { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
            { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
            { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
          },
          format_done = {
            { " ✓ ", hl_group = "NoiceLspProgressSpinner" },
            { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
            { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
          },
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = false,
        },
        signature = {
          enabled = false,
        },
      },
      views = {
        popup = {
          border = {
            style = vim.g.border,
          },
        },
        cmdline_popup = {
          border = {
            style = vim.g.border,
          },
        },
        cmdline_input = {
          border = {
            style = vim.g.border,
          },
        },
        confirm = {
          border = {
            style = vim.g.border,
          },
        },
        mini = {
          timeout = 3000,
          size = {
            max_height = 5,
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    }

    -- apply fix for noice issue with incshearch
    customize_incsearch_for_noice()

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

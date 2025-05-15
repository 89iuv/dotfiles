return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local cycle = function(direction)
      local state = require("bufferline.state")
      local commands = require("bufferline.commands")

      local index = commands.get_current_element_index(state)
      local next_index = index + direction

      if next_index <= 0 then
        return
      end

      if next_index > #state.components then
        return
      end

      commands.cycle(direction)
    end

    vim.keymap.set("n", "<S-h>", function() cycle(-1) end, { desc = "Prev Buffer" })
    vim.keymap.set("n", "<S-l>", function() cycle(1) end, { desc = "Next Buffer" })
    vim.keymap.set("n", "[b", function() cycle(-1) end, { desc = "Prev Buffer" })
    vim.keymap.set("n", "]b", function() cycle(1) end, { desc = "Next Buffer" })

    local new_opts = {
      options = {
        always_show_bufferline = true,
        tab_size = 1,
        truncate_names = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Project Explorer",
            highlight = "BufferlineProjectExplorer",
            text_align = "left",
            separator = true,
          },
        },
        indicator = {
          icon = "▎",
        },
        left_trunc_marker = "󰁍 ",
        right_trunc_marker = "󰁔 ",
        buffer_close_icon = "",
        separator_style = { " ", " " },
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = ""
          if diag.error then
            ret = icons.Error
          elseif diag.warning then
            ret = icons.Warn
          elseif diag.info then
            ret = icons.Info
          elseif diag.hint then
            ret = icons.Hint
          end
          return vim.trim(ret)
        end,
        themable = true,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

return {
  {"famiu/bufdelete.nvim"},
  {"Pocco81/AutoSave.nvim",
    config = function()
      local autosave = require "autosave"

      autosave.setup {
        enabled = true,
        execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filetype_is_not = {},
          modifiable = true,
        },
        clean_command_line_interval = 2500,
        on_off_commands = true,
        write_all_buffers = false,
      }
    end
  }
}

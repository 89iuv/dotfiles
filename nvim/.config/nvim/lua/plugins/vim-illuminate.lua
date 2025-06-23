return {
  "RRethy/vim-illuminate",
  opts = function(_, opts)
    local global = require("config.global")

    local new_opts = {
      delay = 80,
      filetypes_denylist = global.excluded.filetype,
      modes_allowlist = { "n" },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}

require('nvim_comment').setup({
  create_mappings = false
})

local wk = require("which-key")
wk.register({
  ["<leader>/"] = {"<cmd>CommentToggle<cr>", "Comment Toggle" },
})

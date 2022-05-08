local wk = require("which-key")

wk.setup {
  window = {
    border = "single", -- none, single, double, shadow
  }
}

wk.register({
  ["<leader>"] = {
    f = {
      name = "file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    },
    e = {
      name = "explorer",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorere" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus File Explorere" },
      r = { "<cmd>NvimTreeRefresh<cr>", "Refersh File Explorere" },
      m = { "<cmd>NvimTreeFindFile<cr>", "Move to Current Buffer" },
    },
    w = {
      name = "window",
      q = {"<cmd>q<cr>", "Close"},
      s = {"<cmd>sp<cr>", "Split Horizontal"},
      v = {"<cmd>vs<cr>", "Split Vertical"},
      H = {"<cmd>:vertical resize -5<cr>", "Decrease Vertical Size"},
      L = {"<cmd>:vertical resize +5<cr>", "Increase Vertical Size"},
      K = {"<cmd>:resize +5<cr>", "Increase Horizontal Size"},
      J = {"<cmd>:resize -5<cr>", "Decrease Horizontal Size"},
    },
    b = {
      name = "buffer",
      q = {"<cmd>Bdelete<cr>", "Close"},
      f = {"<cmd>Telescope buffers<cr>", "Find Buffer"},
      n = {"<cmd>BufferLineMoveNext<cr>", "Move Buffer to Next"},
      p = {"<cmd>BufferLineMovePrev<cr>", "Move Buffer to Previous"},
      r = {"<cmd>BufferLineCloseRight<cr>", "Close Buffers to the Right"},
      l = {"<cmd>BufferLineCloseLeft<cr>", "Close Buffers to the Left"},
      o = {"<cmd>exe 'BufferLineCloseLeft' | exe 'BufferLineCloseRight'<cr>", "Close Other Buffers"},
    },
    l = {
      name = "lsp",
      h = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Information"},
      a = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration"},
      d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition"},
      i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation"},
      s = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
      r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
      e = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"},
      v = {"<cmd>lua vim.diagnostic.open_float(0, { scope = 'line', border = 'single' })<cr>", "Preview Problem"},
      n = {"<cmd>lua vim.diagnostic.goto_next({ float =  { border = 'single' }})<cr>", "Go to Next Problem"},
      p = {"<cmd>lua vim.diagnostic.goto_prev({ float =  { border = 'single' }})<cr>", "Go to Previous Problem"},
    },
    g = {
      name = "git",
      b = {"<cmd>Gitsigns blame_line<cr>", "Blame"},
      s = {"<cmd>Gitsigns select_hunk<cr>", "Select Hunk"},
      v = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
      n = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk"},
      p = {"<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      c = {"<cmd>Gitsigns diffthis<cr>", "Diff Buffer"},
      d = {"<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer"},
    },
    n = {
      name = "nvim",
      q = {"<cmd>qa<cr>", "Close"},
      x = {"<cmd>qa!<cr>", "Force Close"},
      s = {"<cmd>% source<cr>", "Source Buffer"},
    },
    p = {
      name = "Packer",
      s = {"<cmd>:PackerSync<cr>", "Sync"},
    },
  },

  ["<leader>/"] = {"<cmd>CommentToggle<cr>", "Comment Toggle" },

})

local wk = require("which-key")

wk.setup {
  window = {
    border = "single", -- none, single, double, shadow
  }
}

wk.register({
  ["<leader>"] = {
    k = {
      name = "Key",
      h = {"<cmd>vert help which-key.txt<cr>", "Open Documentation"},
    },
    w = {
      name = "Window",
      q = {"<cmd>q<cr>", "Close"},
      o = {"<cmd>only<cr>", "Close Other Windows"},
      s = {"<cmd>sp<cr>", "Split Horizontal"},
      v = {"<cmd>vs<cr>", "Split Vertical"},
    },
    n = {
      name = "Neovim",
      q = {"<cmd>qa<cr>", "Close"},
      x = {"<cmd>qa!<cr>", "Force Close"},
      s = {"<cmd>source %<cr>", "Source Buffer"},
      c = {"<cmd>checkhealth<cr>", "Check Health"},
    },
    p = {
      name = "Packer",
      y = {"<cmd>:PackerSync<cr>", "Sync"},
      i = {"<cmd>:PackerInstall<cr>", "Install"},
      s = {"<cmd>:PackerStatus<cr>", "Status"},
      d = {"<cmd>:PackerClean<cr>", "Clean"},
      c = {"<cmd>:PackerCompile<cr>", "Compile"},
    },
    s = {
      name = "Search",
      h = {"<cmd>:nohlsearch<cr>", "No highlight search"},
      i = {"<cmd>:set ignorecase<cr>", "Ignore Case"},
      I = {"<cmd>:set noignorecase<cr>", "No Ignore Case"},
    }
  }
})

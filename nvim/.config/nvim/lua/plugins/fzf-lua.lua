return {
  "ibhagwan/fzf-lua",
  depenencies = { "echasnovski/mini.icons" },
  keys = {
    -- find
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Buffers" },

    -- search
    { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },

    -- lsp
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "Code Actions" },
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Definition" },
    { "gD", "<cmd>FzfLua lsp_declarations<cr>", desc = "Declaration" },
    { "gr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
    { "gs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Buffer Symbols" },

    -- diagnostics
    { "<leader>xb", "<cmd>FzfLua diagnostics_document<cr>", desc = "Buffer Diagnostics" },

    -- git
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
    { "<leader>gc", "<cmd>FzfLua git_bcommits<cr>", desc = "Buffer Commits" },
    { "<leader>gh", "<cmd>FzfLua git_hunks<cr>", desc = "Buffer Hunks" },
  },
  config = function()
    local builtin = require("fzf-lua.previewer.builtin")

    local orig_parse_entry = builtin.buffer_or_file.parse_entry
    builtin.buffer_or_file.parse_entry = function(self, entry_str)
      local entry = orig_parse_entry(self, entry_str)
      entry.bufnr = nil -- force the "load file into scratch buffer" path
      return entry
    end

    require("fzf-lua").setup({
      file_icon_padding = "",
      fzf_colors = true,
      fzf_opts = {
        ["--cycle"] = "",
        ["--tiebreak"] = "begin,length",
      },
      winopts = {
        backdrop = 60,
        height = 0.80,
        width = 0.80,
        row = 0.50,
        col = 0.50,
        border = "single",
        preview = {
          border = "single",
          layout = "flex",
          flip_columns = 120,
        },
      },
      defaults = {
        formatter = "path.filename_first",
      },
      files = {
        cwd_prompt = false,
      },
      oldfiles = {
        cwd_only = true,
      },
      lsp = {
        code_actions = {
          previewer = false,
        },
      },
    })

    require("fzf-lua").register_ui_select()
  end,
}

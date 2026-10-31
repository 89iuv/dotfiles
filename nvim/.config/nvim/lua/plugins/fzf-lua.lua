return {
  "ibhagwan/fzf-lua",
  depenencies = {
    "echasnovski/mini.icons",
    "folke/trouble.nvim",
  },
  keys = {
    -- find
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },

    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader><leader>", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Recent Buffers" },

    -- grep
    { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },

    -- search
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
    { "<leader>sh", "<cmd>FzfLua command_history<cr>", desc = "Command History" },

    -- lsp
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "Code Actions" },

    { "<leader>si", "<cmd>FzfLua lsp_implementations<cr>", desc = "Implementation" },
    { "<leader>sr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
    { "<leader>st", "<cmd>FzfLua lsp_typedefs<cr>", desc = "Type Definition" },
    { "<leader>sd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Definition" },
    { "<leader>sD", "<cmd>FzfLua lsp_declarations<cr>", desc = "Declaration" },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>sl", "<cmd>FzfLua lsp_finder<cr>", desc = "References/Definitions/..." },

    { "<leader>sI", "<cmd>FzfLua lsp_incoming_calls<cr>", desc = "Incoming Calls" },
    { "<leader>sO", "<cmd>FzfLua lsp_outgoing_calls<cr>", desc = "Outgoing Calls" },

    -- diagnostics
    { "<leader>sx", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
    { "<leader>sX", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },

    -- git
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
    { "<leader>gc", "<cmd>FzfLua git_bcommits<cr>", desc = "Buffer Commits" },
    { "<leader>gC", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
    { "<leader>gh", "<cmd>FzfLua git_hunks<cr>", desc = "Buffer Hunks" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Branches" },
    { "<leader>ga", "<cmd>FzfLua git_stash<cr>", desc = "Stashes" },
    { "<leader>gt", "<cmd>FzfLua git_tags<cr>", desc = "Tags" },
  },
  config = function()
    local builtin = require("fzf-lua.previewer.builtin")

    local orig_parse_entry = builtin.buffer_or_file.parse_entry
    builtin.buffer_or_file.parse_entry = function(self, entry_str)
      local entry = orig_parse_entry(self, entry_str)
      entry.bufnr = nil -- force the "load file into scratch buffer" path
      return entry
    end

    local config = require("fzf-lua.config")
    local actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-x"] = actions.open

    require("fzf-lua").setup({
      file_icon_padding = "",
      fzf_colors = true,
      -- fzf_colors = {
      --   ---@diagnostic disable-next-line: assign-type-mismatch
      --   ["bg"] = { "bg", "NormalFloat" },
      --   ---@diagnostic disable-next-line: assign-type-mismatch
      --   ["bg+"] = { "bg", { "CursorLine", "NormalFloat" } },
      -- },
      fzf_opts = {
        ["--cycle"] = "",
        ["--tiebreak"] = "begin,length",
      },
      winopts = {
        backdrop = 60,
        height = 0.85,
        width = 0.85,
        row = 0.50,
        col = 0.50,
        border = "single",
        preview = {
          border = "single",
          layout = "flex",
          flip_columns = 100,
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

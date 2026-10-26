return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    -- find
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },

    -- search
    { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
    { "<leader>sg", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Current Word", mode = "v" },

    -- lsp
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "Code Actions" },
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Definition" },
    { "gD", "<cmd>FzfLua lsp_declarations<cr>", desc = "Declaration" },
    { "gr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
  },
  config = function()
    local builtin = require("fzf-lua.previewer.builtin")

    -- Previewer that only reads files from disk, ignoring open buffers
    local FileOnlyPreviewer = builtin.buffer_or_file:extend()

    function FileOnlyPreviewer:new(o, opts, fzf_win)
      FileOnlyPreviewer.super.new(self, o, opts, fzf_win)
      setmetatable(self, FileOnlyPreviewer)
      return self
    end

    function FileOnlyPreviewer:parse_entry(entry_str)
      local entry = FileOnlyPreviewer.super.parse_entry(self, entry_str)
      if entry then
        -- Dropping bufnr makes populate_preview_buf take the
        -- "read file from disk" branch instead of reusing the loaded buffer
        entry.bufnr = nil
      end
      return entry
    end

    require("fzf-lua").setup({
      file_icon_padding = "",
      fzf_colors = true,
      winopts = {
        backdrop = 60,
        height = 0.80,
        width = 0.80,
        row = 0.50,
        col = 0.50,
        border = "single",
        preview = {
          border = "single",
        },
      },
      files = {
        previewer = {
          _ctor = function()
            return FileOnlyPreviewer
          end,
        },
        cwd_prompt = false,
      },
	  grep = {
        previewer = {
          _ctor = function()
            return FileOnlyPreviewer
          end,
        },
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

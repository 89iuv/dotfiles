return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" }
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
      fzf_colors = true,
      winopts = {
        backdrop = 100,
        border = "single",
        preview = {
          border = "single",
        }
      },
      files = {
        previewer = { _ctor = function() return FileOnlyPreviewer end },
        cwd_prompt = false,
      }
    })
  end,
}

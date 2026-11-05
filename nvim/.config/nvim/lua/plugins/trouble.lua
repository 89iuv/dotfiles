return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    -- lsp
    { "<leader>xd", "<cmd>Trouble lsp_definitions<cr>", desc = "Lsp Definition" },
    { "<leader>xD", "<cmd>Trouble lsp_declarations<cr>", desc = "lsp Declaration" },
    { "<leader>xr", "<cmd>Trouble lsp_references<CR>", desc = "Lsp References" },
    { "<leader>xI", "<cmd>Trouble lsp_implementations<cr>", desc = "Lsp Implementation" },
    { "<leader>xy", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Lsp Type Definition" },
    { "<leader>xai", "<cmd>Trouble lsp_incoming_calls<CR>", desc = "Lsp Incoming Calls" },
    { "<leader>xao", "<cmd>Trouble lsp_outgoing_calls<CR>", desc = "Lsp Outgoing Calls" },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle auto_refresh=true focus=true win.position=right win.size=55<cr>",
      desc = "Lsp Document Symbols",
    },
    { "<leader>xl", "<cmd>Trouble lsp win.position=right win.size=55<cr>", desc = "LSP References/Definitions/..." },

    -- diagnostics
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostic" },
  },
  config = function()
    -- WARN: monkey patch to alwyas show the scratch buffer
    local Util = require("trouble.util")
    local preview = require("trouble.view.preview")
    ---@diagnostic disable-next-line: duplicate-set-field
    preview.create = function(item, _)
      local buf = vim.api.nvim_create_buf(false, true)
      vim.bo[buf].bufhidden = "wipe"
      vim.bo[buf].buftype = "nofile"
      local lines = Util.get_lines({ path = item.filename, buf = item.buf })
      if not lines then
        return
      end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      local ft = item:get_ft(buf)
      if ft then
        local lang = vim.treesitter.language.get_lang(ft)
        if not pcall(vim.treesitter.start, buf, lang) then
          vim.bo[buf].syntax = ft
        end
      end
      return buf
    end

    require("trouble").setup({
      auto_preview = false,
      auto_refresh = false,
      follow = false,
      focus = true,
      preview = {
        type = "main",
        scratch = true,
        bo = {
          filetype = "trouble_preview",
        },
      },
      modes = {
        lsp_base = {
          auto_preview = true,
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.65,
            wo = {
              number = true,
            },
          },
          win = {
            position = "bottom",
            size = 15,
            wo = {
              winfixwidth = false,
            },
          },
        },
      },
    })
  end,
}

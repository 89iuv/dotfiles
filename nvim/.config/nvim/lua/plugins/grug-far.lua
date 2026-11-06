return {
  "MagicDuck/grug-far.nvim",
  -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
  -- additional lazy config to defer loading is not really needed...
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search and Replace",
    },
  },
  config = function()
    require("grug-far").setup({
      helpLine = {
        -- whether to show the help line at the top of the buffer
        enabled = false,
      },
    })

    -- use q and esc to close the window
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "grug-far",
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        -- Map 'q' to close the window
        vim.keymap.set("n", "q", function()
          vim.cmd("close")
          pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
        end, {
          buffer = event.buf,
          silent = true,
          desc = "Close grug-far",
        })

        -- Map '<Esc>' to close the window
        vim.keymap.set("n", "<Esc>", function()
          vim.cmd("close")
          pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
        end, {
          buffer = event.buf,
          silent = true,
          desc = "Close grug-far",
        })
      end,
    })

    -- style window
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "grug-far" },
      callback = function()
        vim.api.nvim_win_set_width(0, 60)
        vim.wo.winhighlight = "Normal:NormalFloat"
      end,
    })

    -- overwrite highlight mode
    local old_nvim_buf_set_extmark = vim.api.nvim_buf_set_extmark
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.api.nvim_buf_set_extmark = function(buffer, ns_id, line, col, opts)
      local ns = vim.api.nvim_get_namespaces()["grug-far-namespace"]
      if ns == ns_id then
        opts.hl_mode = "combine"
      end
      return old_nvim_buf_set_extmark(buffer, ns_id, line, col, opts)
    end
  end,
}

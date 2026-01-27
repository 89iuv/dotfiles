return {
  -- fix for: https://github.com/lukas-reineke/virt-column.nvim/issues/49
  -- "lukas-reineke/virt-column.nvim"
  "IronGeek/virt-column.nvim",
  branch = "fix/off-by-one",
  enabled = true,
  lazy = true,
  event = function()
    if vim.g.virt_column then
      return "BufEnter"
    end
  end,
  opts = function()
    Snacks.toggle
      .new({
        name = "Line Column",
        get = function()
          return vim.g.virt_column
        end,
        set = function(state)
          vim.g.virt_column = state
          require("virt-column").update({ enabled = vim.g.virt_column })
        end,
      })
      :map("<leader>uu")

    -- WARN: ugly hack in order to let the buffer overwrite the config
    local M = require("virt-column.config")
    local utils = require("virt-column.utils")

    ---@param behavior "merge"|"overwrite"
    ---@param base virtcolumn.config.full
    ---@param input virtcolumn.config?
    ---@return virtcolumn.config.full
    local merge_configs = function(behavior, base, input)
      local result = vim.tbl_deep_extend("keep", input or {}, base) --[[@as virtcolumn.config.full]]

      if behavior == "merge" and input then
        result.exclude.filetypes = utils.tbl_join(base.exclude.filetypes, vim.tbl_get(input, "exclude", "filetypes"))
        result.exclude.buftypes = utils.tbl_join(base.exclude.buftypes, vim.tbl_get(input, "exclude", "buftypes"))
      end

      return result
    end

    --- Returns the configuration for a buffer
    ---@param bufnr number
    ---@return virtcolumn.config.full
    ---@diagnostic disable-next-line: duplicate-set-field
    M.get_config = function(bufnr)
      bufnr = utils.get_bufnr(bufnr)
      return merge_configs("overwrite", M.config or M.default_config, M.buffer_config[bufnr])
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("virt-column").setup_buffer(event.buf, {
            enabled = false,
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("virt-column").setup_buffer(event.buf, {
            enabled = false,
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("virt-column").setup_buffer(event.buf, {
            enabled = vim.g.virt_column,
            exclude = {
              filetypes = {},
            },
          })
        end
      end,
    })

    return {
      enabled = vim.g.virt_column,
      char = { "│", "┃" },
      virtcolumn = "80,120",
      highlight = "VirtColumn",
      exclude = {
        filetypes = vim.g.special_filetypes,
      },
    }
  end,
}

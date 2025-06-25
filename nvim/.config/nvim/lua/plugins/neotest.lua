return {
  "nvim-neotest/neotest",
  opts = {
    floating = {
      border = require("config.global").border,
    },
    status = {
      enabled = true,
      signs = true,
      virtual_text = false,
    },
    output = {
      open_on_run = false,
    },
    output_panel = {
      enabled = true,
    },
    quickfix = {
      enabled = false,
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "┐",
      failed = "",
      final_child_indent = " ",
      final_child_prefix = "└",
      non_collapsible = "─",
      notify = "",
      passed = "",
      running = "",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "",
      unknown = "",
      watching = "",
    },
  },
}

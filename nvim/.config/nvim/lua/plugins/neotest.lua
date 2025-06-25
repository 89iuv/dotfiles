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
      enabled = true,
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

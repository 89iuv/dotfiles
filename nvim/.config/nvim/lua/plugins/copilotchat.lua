return {
  "CopilotC-Nvim/CopilotChat.nvim",
  build = "make tiktoken",
  opts = {
    highlight_headers = true,
    separator = string.rep("─", 3),
    error_header = "> [!ERROR] Error",

    chat_autocomplete = true,

    auto_follow_cursor = true,
    auto_insert_mode = true,
    insert_at_end = false,
  }
}

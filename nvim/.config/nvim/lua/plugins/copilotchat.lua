return {
  "CopilotC-Nvim/CopilotChat.nvim",
  build = "make tiktoken",
  opts = {
    highlight_headers = true,
    separator = string.rep("─", 3),
    error_header = "> [!ERROR] Error",

    insert_at_end = true,
    chat_autocomplete = true,
  }
}

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  build = "make tiktoken",
  opts = {
    highlight_headers = false,
    separator = string.rep("─", 3),
    error_header = "> [!ERROR] Error",

    insert_at_end = true,
    chat_autocomplete = false,

    model = "gpt-4.1",
    context = "buffer",
  }
}

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    insert_at_end = true,
    chat_autocomplete = false,
  },
}

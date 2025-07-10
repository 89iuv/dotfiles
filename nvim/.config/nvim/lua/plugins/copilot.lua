-- plugin is used only for github 2 factor authentication
return {
  "zbirenbaum/copilot.lua",
  opts = {
    filetypes = {
      markdown = false,
      help = false,
      ["*"] = false,
    },
  },
}

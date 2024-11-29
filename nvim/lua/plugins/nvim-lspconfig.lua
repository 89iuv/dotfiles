local python_path = vim.system({ "which", "python" }, { text = true, timeout = 5000 }):wait().stdout
local settings = {}
if python_path then
  python_path = string.gsub(python_path, "\n", "")
  settings = {
    ["robot.python.executable"] = python_path,
  }
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        filetypes = { "sh" },
      },
      robotframework_ls = {
        settings = settings,
      },
      ltex = {
        settings = {
          ltex = {
            language = "en-US",
          },
        },
      },
    },
  },
}

require("bufferline").setup{
  options = {
    close_command = function(bufnum)
      require('bufdelete').bufdelete(bufnum, true)
    end,
    offsets = {
      {
        filetype = "NvimTree",
        padding = 1
      }
    },
    diagnostics = "nvim_lsp",
    show_close_icon = false,
    themable = false,
  },

}

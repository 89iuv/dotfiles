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
    diagnostics_update_in_insert = false,
    show_close_icon = false,
    themable = true,
  },

}

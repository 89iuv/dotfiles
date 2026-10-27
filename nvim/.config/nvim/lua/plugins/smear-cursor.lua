return {
	"sphamba/smear-cursor.nvim",
    enabled = true,
	opts = function()
		local smear_cursor = require("smear_cursor")

		-- Disable when entering visual mode
		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "*:[vV\x16]",
			callback = function()
				smear_cursor.enabled = false
			end,
		})

		-- Enable when leaving visual mode
		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "[vV\x16]:*",
			callback = function()
				smear_cursor.enabled = true
			end,
		})

		return {
			cursor_color = "none",
			smear_insert_mode = false,
			smear_terminal_mode = false,
			smear_to_cmd = false,
		}
	end,
}

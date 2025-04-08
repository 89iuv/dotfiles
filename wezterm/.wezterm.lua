local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- window decorations
config.enable_tab_bar = true
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.use_fancy_tab_bar = true

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window size
config.initial_cols = 128
config.initial_rows = 36
config.use_resize_increments = false

-- paste options
-- rewrite line endings to LF when pasting
config.canonicalize_pasted_newlines = "LineFeed"

-- cursor
config.cursor_blink_rate = 0 -- disable cursor blink

-- keymaps
local insert_key_pass = function(opts)
	for _, key in ipairs(opts.keys) do
		table.insert(opts.conf, {
			key = key,
			mods = opts.modifier_from,
			action = wezterm.action.SendKey({
				key = key,
				mods = opts.modifier_to,
			}),
		})
	end
end

config.keys = {}
insert_key_pass({
	conf = config.keys,
	keys = { ",", ".", "-", "=", "w", "p", "m" },
	modifier_from = "SUPER",
	modifier_to = "ALT",
})

insert_key_pass({
	conf = config.keys,
	keys = { "<", ">" },
	modifier_from = "SUPER|SHIFT",
	modifier_to = "ALT|SHIFT",
})

-- and finally, return the configuration to wezterm
return config

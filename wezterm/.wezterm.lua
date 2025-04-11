local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- cursor
config.cursor_blink_rate = 0 -- disable cursor blink

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- tabs
-- config.use_fancy_tab_bar = true
config.enable_tab_bar = false
-- config.show_tabs_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false

-- window decorations
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window size
config.initial_cols = 120
config.initial_rows = 30
config.use_resize_increments = false

-- close confirmation
config.window_close_confirmation = "NeverPrompt"

-- keymaps helpers
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

local insert_key_map = function(opts)
	table.insert(opts.conf, {
		key = opts.key_from,
		mods = opts.modifier_from and opts.modifier_from or "",
		action = wezterm.action.SendKey({
			key = opts.key_to,
			mods = opts.modifier_to and opts.modifier_to or "",
		}),
	})
end

-- passthrough keys from cmd to alt
config.keys = {}
insert_key_pass({
	conf = config.keys,
	keys = { ",", ".", "-", "=", "w", "p", "m", "i", "o" },
	modifier_from = "SUPER",
	modifier_to = "ALT",
})

insert_key_pass({
	conf = config.keys,
	keys = { "<", ">" },
	modifier_from = "SUPER|SHIFT",
	modifier_to = "ALT|SHIFT",
})

-- remap keys
insert_key_map({
	conf = config.keys,
	key_from = "§",
	key_to = "`",
})

insert_key_map({
	conf = config.keys,
	key_from = "±",
	modfier_from = "SHIFT",
	key_to = "~",
	modifier_to = "SHIFT",
})

-- and finally, return the configuration to wezterm
return config

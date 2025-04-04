local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- window decorations
config.enable_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window size
config.initial_cols = 120
config.initial_rows = 32
config.use_resize_increments = false

-- paste options
-- rewrite line endings to LF when pasting
config.canonicalize_pasted_newlines = "LineFeed"

-- keymaps
local normal_keys = { ",", "." }
local shift_keys = { "<", ">" }

local insert_key_pass = function(conf, keys, modifier)
	modifier = modifier and "|" .. modifier or ""
	for _, key in ipairs(keys) do
		table.insert(conf, {
			key = key,
			mods = "SUPER",
			action = wezterm.action.SendKey({
				key = key,
				mods = "ALT",
			}),
		})
	end
end

config.keys = {}
insert_key_pass(config.keys, normal_keys)
insert_key_pass(config.keys, shift_keys, "SHIFT")

-- and finally, return the configuration to wezterm
return config

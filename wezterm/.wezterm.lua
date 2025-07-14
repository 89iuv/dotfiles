local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Macchiato"

-- performance
config.max_fps = 120

-- MacOS
if wezterm.target_triple:find("darwin") then
	-- font
	config.font_size = 13
	config.line_height = 1.0
end

-- Windows
if wezterm.target_triple:find("windows") then
	-- font
	config.font_size = 13
	config.line_height = 1.0

	--default domain
	config.default_domain = "WSL:Ubuntu"
end

-- disable scroll bar
config.enable_scroll_bar = false

-- cursor
config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 0

-- tabs
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = true

-- window decorations
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window size
config.initial_cols = 128
config.initial_rows = 36
config.use_resize_increments = false

config.window_padding = {
	left = "1.00cell",
	right = "1.00cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

-- disable close confirmation
config.window_close_confirmation = "NeverPrompt"

-- insert key passthrough
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

-- insert key mapping
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

-- passthrough keys from shift+cmd to shift+alt
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

-- remap shift+keys
insert_key_map({
	conf = config.keys,
	key_from = "±",
	modfier_from = "SHIFT",
	key_to = "~",
	modifier_to = "SHIFT",
})

-- hide tab bar when full screen
wezterm.on("window-resized", function(window, _)
	local new_config
	if window:get_dimensions().is_full_screen then
		new_config = {
			hide_tab_bar_if_only_one_tab = true,
		}
	else
		new_config = {
			hide_tab_bar_if_only_one_tab = false,
		}
	end
	local overrides = window:get_config_overrides() or {}
	local diff = false
	for k, v in pairs(new_config) do
		if overrides[k] ~= v then
			diff = true
			overrides[k] = v
		end
	end
	if diff then
		window:set_config_overrides(overrides)
	end
end)

-- and finally, return the configuration to wezterm
return config

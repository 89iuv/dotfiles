local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Macchiato"

-- performance
config.max_fps = 60
-- config.front_end = "WebGpu"
config.enable_kitty_graphics = true

-- font
config.line_height = 1.13

-- Linux
if wezterm.target_triple:find("linux") then
  -- font
  config.font_size = 12
end

-- Mac OS
if wezterm.target_triple:find("darwin") then
  -- font
  config.font_size = 14
end

-- Windows WSL
if wezterm.target_triple:find("windows") then
  -- font
  config.font_size = 10

  --default domain
  config.default_domain = "WSL:Ubuntu"
end

-- disable scrollbar
config.enable_scroll_bar = false

-- cursor
config.cursor_blink_rate = 0

-- tabs
config.enable_tab_bar = false
-- config.use_fancy_tab_bar = true
-- config.show_tabs_in_tab_bar = true
-- config.show_new_tab_button_in_tab_bar = true

-- window decorations
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window size
config.initial_cols = 140
config.initial_rows = 35
config.use_resize_increments = false

config.window_padding = {
  left = "2px",
  right = "2px",
  top = "2px",
  bottom = "2px",
}

-- disable close confirmation
config.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return config

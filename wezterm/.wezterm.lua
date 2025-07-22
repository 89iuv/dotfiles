local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Macchiato"

-- performance
config.max_fps = 60

-- font
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Regular" },
  { family = "Symbols Nerd Font Mono" },
})
-- config.use_cap_height_to_scale_fallback_fonts = true
config.allow_square_glyphs_to_overflow_width = "Always"
config.line_height = 1.13

-- user interface
config.enable_scroll_bar = false
config.cursor_blink_rate = 0

-- protocols
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true
config.canonicalize_pasted_newlines = "LineFeed"

-- Linux
if wezterm.target_triple:find("linux") then
  -- tabs
  config.enable_tab_bar = false

  -- font
  config.font_size = 11
end

-- Mac OS
if wezterm.target_triple:find("darwin") then
  -- tabs
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = true
  config.show_tabs_in_tab_bar = true
  config.show_new_tab_button_in_tab_bar = true

  -- window decorations
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

  -- font
  config.font_size = 14
end

-- Windows WSL
if wezterm.target_triple:find("windows") then
  -- tabs
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = true
  config.show_tabs_in_tab_bar = true
  config.show_new_tab_button_in_tab_bar = true

  -- window decorations
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

  -- font
  config.font_size = 10

  --default domain
  config.default_domain = "WSL:Ubuntu"
end

-- window size
config.initial_cols = 138
config.initial_rows = 32
config.use_resize_increments = false

config.window_padding = {
  left = "4",
  right = "4",
  top = "4",
  bottom = "4",
}

-- and finally, return the configuration to wezterm
return config

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15

-- config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"

config.enable_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"


config.initial_cols = 128
config.initial_rows = 38
config.use_resize_increments = false

-- and finally, return the configuration to wezterm
return config

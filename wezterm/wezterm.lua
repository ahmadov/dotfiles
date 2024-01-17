local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local color_scheme_name = 'Ayu Dark (Gogh)'
local color_scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
color_scheme.background = '#000'
color_scheme.foreground = '#ebdbb3'

config.color_schemes = { ['scheme'] = color_scheme }
config.color_scheme = 'scheme'

config.font = wezterm.font('Liga SFMono Nerd Font')
config.font = wezterm.font_with_fallback({
  'FiraCode Nerd Font',
})

config.default_prog = { '/usr/local/bin/fish', '-l' }
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 16

return config


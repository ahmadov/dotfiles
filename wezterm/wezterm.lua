local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local color_scheme = 'Gruvbox dark, hard (base16)'
local gruvbox = wezterm.color.get_builtin_schemes()[color_scheme]
gruvbox.background = '#000'
gruvbox.foreground = '#ebdbb3'

config.color_schemes = { ['gruvbox'] = gruvbox }
config.color_scheme = 'gruvbox'

config.font = wezterm.font('Liga SFMono Nerd Font')
config.font = wezterm.font_with_fallback({
  'FiraCode Nerd Font',
})

config.default_prog = { '/usr/local/bin/fish', '-l' }
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 16

return config


local wezterm = require('wezterm')

return {
  freetype_load_flags = 'NO_HINTING',
  front_end = 'OpenGL',
  font = wezterm.font_with_fallback({
    'Liga SFMono Nerd Font',
    'FiraCode Nerd Font',
  }),
  font_size = 12,
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },

  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 26,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_tab_index_in_tab_bar = true,
  switch_to_last_active_tab_when_closing_tab = true,

  inactive_pane_hsb = {
    saturation = 1.1,
    hue = 1.0,
    brightness = 0.6
  },
}


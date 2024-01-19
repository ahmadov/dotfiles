local wezterm = require 'wezterm'

local config = {}

-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

local color_scheme_name = 'Ayu Dark (Gogh)'
local color_scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
color_scheme.background = '#000'
color_scheme.foreground = '#ebdbb3'

config.color_schemes = { ['scheme'] = color_scheme }
config.color_scheme = 'scheme'
config.freetype_load_flags = 'NO_HINTING'
config.front_end = 'OpenGL'

config.font = wezterm.font_with_fallback({
  'Liga SFMono Nerd Font',
  'FiraCode Nerd Font',
})

config.default_prog = { '/usr/local/bin/fish', '-l' }
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12

config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

-- config.unix_domains = {
--   {
--     name = 'unix',
--   },
-- }
config.default_gui_startup_args = { 'connect', 'unix' }

config.hyperlink_rules = {
  -- Matches: a URL in parens: (URL)
  {
     regex = '\\((\\w+://\\S+)\\)',
     format = '$1',
     highlight = 1,
  },
  -- Matches: a URL in brackets: [URL]
  {
     regex = '\\[(\\w+://\\S+)\\]',
     format = '$1',
     highlight = 1,
  },
  -- Matches: a URL in curly braces: {URL}
  {
     regex = '\\{(\\w+://\\S+)\\}',
     format = '$1',
     highlight = 1,
  },
  -- Matches: a URL in angle brackets: <URL>
  {
     regex = '<(\\w+://\\S+)>',
     format = '$1',
     highlight = 1,
  },
  -- Then handle URLs not wrapped in brackets
  {
     regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
     format = '$0',
  },
  -- implicit mailto link
  {
     regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
     format = 'mailto:$0',
  },
}

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '_',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
  {
    mods = 'LEADER',
    key = 'm',
    action = wezterm.action.TogglePaneZoomState
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = 'LEADER',
    key = '0',
    action = wezterm.action.PaneSelect { mode = 'Activate' },
  },
   -- activate copy mode or vim mode
  {
    key = 'Enter',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.SpawnWindow
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab {
      DomainName = 'unix',
    },
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  { key = 's', mods = 'LEADER', action = wezterm.action.ShowTabNavigator }
}
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- config.tab_bar_style = {
--   active_tab_left = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#2b2042' } },
--     { Text = '' },
--   },
--   active_tab_right = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#2b2042' } },
--     { Text = '' },
--   },
--   inactive_tab_left = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#1b1032' } },
--     { Text = '' },
--   },
--   inactive_tab_right = wezterm.format {
--     { Background = { Color = '#0b0022' } },
--     { Foreground = { Color = '#1b1032' } },
--     { Text = '' },
--   },
-- }

config.inactive_pane_hsb = {
  saturation = 1.0,
  hue = 1.0,
  brightness = 0.5,
}

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#0b0022',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

return config

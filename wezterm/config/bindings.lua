local wezterm = require('wezterm')

local keys = {
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
    -- action = wezterm.action.SpawnWindow
    action = wezterm.action.ActivateTabRelative(1),
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
  { key = 's', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
}
for i = 1, 8 do
  table.insert(keys, {
    key = tostring(i),
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return {
  -- leader = { key = 'Space', mods = 'CTRL|SHIFT' },
   leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
   keys = keys,
}

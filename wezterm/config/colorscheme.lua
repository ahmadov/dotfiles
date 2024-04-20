local wezterm = require 'wezterm'

local color_scheme_name = 'Ayu Dark (Gogh)'
local color_scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
color_scheme.background = '#111'
color_scheme.foreground = '#ebdbb3'

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local edge_background = '#000'
  local background = '#282828'
  local foreground = '#a89984'

  if tab.is_active then
    background = '#fea019'
    foreground = '#3c3836'
  elseif hover then
    background = '#403d3c'
    foreground = '#a89984'
  end

  local title = tab_title(tab)

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  title = wezterm.truncate_right(title, max_width + 2)

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = (tab.tab_index + 1) .. ": " .. title .. " " },
  }
end)

return {
   color_schemes = { ['scheme'] = color_scheme },
   color_scheme = 'scheme',
   colors = {
     tab_bar = {
       background = '#000',
     },
   }
}

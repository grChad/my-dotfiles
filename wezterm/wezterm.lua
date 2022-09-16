local wezterm = require('wezterm')

local SOLID_LEFT_ARROW = ""
local SOLID_RIGHT_ARROW = ""

return {
   -- font = wezterm.font('Comic Code Ligatures', { weight = 'Bold', italic = true }),
   font = wezterm.font('Comic Code Ligatures'),
   font_size = 10,
   color_scheme = 'Dracula (Gogh)',
   colors = require('configs.colors'),
   default_cursor_style = 'BlinkingBar',
   cursor_blink_rate = 0,
   initial_cols = 110,
   initial_rows = 25,
   -- window_decorations = 'RESIZE',
   tab_max_width = 15,
   use_fancy_tab_bar = false, -- Para poder editar los buffers
   enable_scroll_bar = false,
   -- hide_tab_bar_if_only_one_tab = true,
   tab_bar_at_bottom = true,
   window_frame = require('configs.tab_bar'),
   wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
      local zoomed = '  '
      local logo_end = '    '
      if tab.active_pane.is_zoomed then
         zoomed = '[Z] '
      end

      local index = ''
      if #tabs > 1 then
         index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
      end

      return zoomed .. index .. tab.active_pane.title .. logo_end
   end),
   wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
      local edge_background = '#333333'
      local background = '#445760'
      local foreground = '#DDDAD6'

      if tab.is_active then
         background = '#3BAEE5'
         foreground = '#181818'
      end

      local edge_foreground = background

      local title = wezterm.truncate_right(tab.active_pane.title, max_width - 3)

      return {
         { Background = { Color = edge_background } },
         { Foreground = { Color = edge_foreground } },
         { Text = ' ' .. SOLID_LEFT_ARROW },
         { Background = { Color = background } },
         { Foreground = { Color = foreground } },
         { Text = title },
         { Background = { Color = edge_background } },
         { Foreground = { Color = edge_foreground } },
         { Text = SOLID_RIGHT_ARROW },
      }
   end),
   window_padding = { left = 2, right = 2, top = 0, bottom = 0 }, -- se cambia con frecuencia.
}

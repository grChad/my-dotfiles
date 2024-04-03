local wezterm = require('wezterm')

local Fonts = wezterm.font_with_fallback({
   -- use_cap_height_to_scale_fallback_fonts = true,
   {
      family = 'ComicCodeLigatures Nerd Font SemiBold',
      weight = 'Medium',
      italic = false,
   },
   {
      family = 'ComicCodeLigatures Nerd Font Bold',
      weight = 'Bold',
      italic = false,
   },
   {
      family = 'ComicCodeLigaturesMedIta Nerd Font',
      weight = 'Medium',
      italic = true,
   },
   {
      family = 'ComicCodeLigatures Nerd Font Bold Italic',
      weight = 'Bold',
      italic = true,
   },
})

return Fonts

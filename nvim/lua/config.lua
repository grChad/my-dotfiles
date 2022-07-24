local icons = require('icons')

EcoVim = {
   colorscheme = 'onedark',
   ui = {
      float = {
         border = 'rounded'
      }
   },
   plugins = {
      completion = {
         select_first_on_enter = false
      },
      rooter = {
         patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
      },
      zen = {
         kitty_enabled = false,
         enabled = true, -- sync after change
      },
   },
   icons = icons,
   statusline = {
      path_enabled = true,
      path = 'relative' -- absolute/relative
   },
   lsp = {
      virtual_text = false,
   },
}

require('onedark').setup({
   dark_float = false,                   -- Ventanas flotantes mas oscuras
   hide_inactive_statusline = true,
   dark_sidebar = true,                  -- NvimTree background, poco mas oscuro

   overrides = function()
      return {
         Visual = { style = 'inverse' }
      }
   end,
   dev = true,
})

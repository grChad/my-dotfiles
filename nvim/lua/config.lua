local icons = require('icons')

EcoVim = {
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
      virtual_text = true, -- para el plugin de diagnostics
   },
}

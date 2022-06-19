-- NOTE: modifical los colores desde aqui.
local colors = {
   background_1   = '#21252B',
   background_2   = '#353535',
   dark_bg        = '#080808',
   text_white     = '#D0CACA',
   icon_git       = '#F94739',

   -- mode Vim
   normal_bg      = '#DAA520',
   normal_text    = '#080808',

   insert_bg      = '#569CD6',
   insert_text    = '#080808',

   visual_bg      = '#79dac8',
   visual_text    = '#080808',

   replace_bg     = '#DA6A73',
   replace_text   = '#080808',

   command_bg     = '#98c379',
   command_text   = '#080808',
}

-- NOTE: Agregar iconos en lugar de NORMAL, INSERT.. por default es => 'mode'
local mode_custom = {
   function() return '   ' end,
   padding = { left = 0, right = 0 },
   separator = { left = '', right = '' }
}

-- NOTE: modificado del tema 'bubbles' y 'dracula'
local theme_custom = {
   normal = {
      a = { fg = colors.normal_text, bg = colors.normal_bg },
      b = { fg = colors.text_white, bg = colors.background_2 },
      c = { fg = colors.background_1, bg = colors.background_1 },
   },

   insert = { a = { fg = colors.insert_text, bg = colors.insert_bg } },
   visual = { a = { fg = colors.visual_text, bg = colors.visual_bg } },
   replace = { a = { fg = colors.replace_text, bg = colors.replace_bg } },
   command = { a = { fg = colors.command_text, bg = colors.command_bg } },

   inactive = {
      a = { fg = colors.text_white, bg = colors.dark_bg },
      b = { fg = colors.text_white, bg = colors.dark_bg },
      c = { fg = colors.normal_text, bg = colors.dark_bg },
   },
}

require('lualine').setup {
   options = {
      theme = theme_custom,
      component_separators = '|',
      section_separators = { left = '', right = '' },
      globalstatus = 3, -- para tener todos los estados de los buffers en un solo lugar, nvim 0.7
   },
   sections = {
      lualine_a = { mode_custom },
      lualine_b = {
         { 'branch', icon = { '', color = { fg = colors.icon_git } } },
         {
            'diff',
            symbols = { added = " ", modified = " ", removed = " " }
         },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
         { 'filetype', icon_only = true, padding = { left = 0 }, separator = '' },
         {
            'filename',
            file_status = false, -- sin iconos de esdos
            path = 1, -- ruta relativa al documento principal
         },
         {
            'diagnostics',
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
         },
         { 'progress', padding = { left = 1, right = 1} }
      },
      lualine_z = {
         {
            'location',
            padding = { left = 0, right = 0 },
            separator = { left = '', right = '' }
         },
      },
   },
   inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
   },
   tabline = {},
   extensions = {},
}

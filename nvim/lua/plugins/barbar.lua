local icons = {
   separator      = '|',
   separator_left = ' ',
   close          = '',
   gitChange      = '',
   pinned         = '車',
}

-- NOTE: Configuracion de Barbar
vim.g.bufferline = {
   animation               = true,       -- Enable/disable Animacion
   auto_hide               = false,      -- Oculta la barra cuando queda solo un buffer
   tabpages                = true,       -- Indicador de pestanas Totales
   closable                = true,       -- Boton de cerrar y estado
   clickable               = true,       -- Clickear las pestanias
   exclude_ft              = {'qf'},     -- Excluir algun fileType
   icons                   = 'both',     -- para 'both', muestra el indice del buffer y el icono del fileType
   icon_custom_colors      = false,      -- en false, toma por default de 'web-devicons'
   icon_separator_active   = icons.separator_left, -- Icono de separacion activo
   icon_separator_inactive = icons.separator,      -- Icono de separacion Inactivo
   icon_close_tab          = icons.close,          -- Icono para cerrar el buffer
   icon_close_tab_modified = icons.gitChange,      -- Icono cuando se modifica el buffer
   icon_pinned             = icons.pinned,         -- No se en que se usa.
   insert_at_end           = false,      -- Insertar buffer al final de la lista
   maximum_padding         = 0,          -- Padding maximo por buffer
   maximum_length          = 30,         -- Width maximo por buffer
   semantic_letters        = true,       -- Para establecer letras a los buffers en modo de seleccion
   no_name_title           = nil,        -- Para nombrar a los buffer sin nombre, default => [Buffer X]

   -- Las nuevas letras de los buffers se asignaran en este orden, genial para teclados qwerty
   letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}

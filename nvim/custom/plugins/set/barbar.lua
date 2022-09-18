local iconos = require('custom.iconos')

-- NOTE: Configuracion de Barbar
vim.g.bufferline = {
   animation               = true, -- Enable/disable Animacion
   auto_hide               = true, -- Oculta la barra cuando queda solo un buffer
   tabpages                = true, -- Indicador de pestanas Totales
   closable                = true, -- Boton de cerrar y estado
   clickable               = true, -- Clickear las pestanias
   exclude_ft              = { 'qf' }, -- Excluir algun fileType
   icons                   = 'both', -- para 'both', muestra el indice del buffer y el icono del fileType
   icon_custom_colors      = false, -- en false, toma por default de 'web-devicons'
   icon_separator_active   = iconos.separators.round.left, -- Icono de separacion activo
   icon_separator_inactive = iconos.separators.line.favorite, -- Icono de separacion Inactivo
   icon_close_tab          = iconos.others.close, -- Icono para cerrar el buffer
   icon_close_tab_modified = iconos.git.modifier, -- Icono cuando se modifica el buffer
   icon_pinned             = iconos.others.pinned, -- No se en que se usa.
   insert_at_end           = true, -- Insertar buffer al final de la lista
   maximum_padding         = 0, -- Padding maximo por buffer
   maximum_length          = 30, -- Width maximo por buffer
   semantic_letters        = false, -- Para establecer letras a los buffers en modo de seleccion
   no_name_title           = nil, -- Para nombrar a los buffer sin nombre, default => [Buffer X]

   -- Las nuevas letras de los buffers se asignaran en este orden, genial para teclados qwerty
   letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}

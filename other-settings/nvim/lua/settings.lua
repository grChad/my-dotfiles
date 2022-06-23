local set = vim.opt

-- OPCION DE INTERFAS DE USUARIO ----------------------------------
set.mouse = 'a'                      -- Para usar el mouse
set.number = true                    -- Enumerar las filas de codigo
-- set.relativenumber = true            -- Numeros relativos
set.clipboard = 'unnamedplus'        -- Portapapeles
set.cursorline = true                -- Para el background del cursor en fila
set.signcolumn = 'yes'               -- columna de signos, gitSign
set.termguicolors = true             -- Es requerido para personalizar el editor

-- OPCION DE INDENTACION ------------------------------------------
-- set.numberwidth = 3               -- margin para ver mejor el numero relativo
set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.expandtab = true
set.smarttab = true
set.smartindent = true

-- OPCION DE BUSQUEDA ---------------------------------------------
set.hidden = true
set.ignorecase = true
set.smartcase = true

-- OPCION DE RENDERIZADO DE TEXTO ---------------------------------
set.wrap = false                     -- Text Wrap

-- OPTIONS OTHERS -------------------------------------------------
set.cmdheight = 1                    -- height de la terminal
set.timeoutlen = 300
set.updatetime = 300
set.undofile = true
set.ruler = false                    -- muestra el cursor todo el tiempo
set.list = true                      -- for plug indent-blanckline

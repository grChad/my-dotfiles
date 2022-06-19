local set = vim.opt

-- OPCION DE INTERFAS DE USUARIO ----------------------------------
set.mouse = 'nvi'                    -- Usar el mouse, pero no en modo linea de comando
set.fileencoding = 'utf-8'           -- File content encoding for the buffer
set.number = true                    -- Enumerar las filas de codigo
-- set.relativenumber = true            -- Numeros relativos
set.clipboard = 'unnamedplus'        -- Portapapeles
set.cursorline = true                -- Resalta la linea donde esta el cursor
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
set.wildignorecase = true            -- Ignore case in filenames browsed by wildmenu
set.smartcase = true
set.incsearch = true                 -- Highlight en busqueda de manera incremental

-- OPCION DE RENDERIZADO DE TEXTO ---------------------------------
set.wrap = false                     -- Text Wrap
set.linebreak = true                -- Romper la linea si la palabra no alcanza.

-- OPTIONS OTHERS -------------------------------------------------
set.cmdheight = 1                    -- height de la terminal
set.completeopt = {"menuone", "noselect"} -- Completion engine options
set.fixeol = true                    -- Restaurar EOL y EOF si falta escribir
set.foldmethod = 'marker'            -- Plegado con soporte de triples
set.inccommand = "split"
set.laststatus = 3                   -- Una sola linea de estados para todos los splits
set.nrformats = 'unsigned'           -- Treat all numbers as unsigned with <C-A> and <C-X>
set.scrolloff = 5                    -- Dejar 5 lineas por encima o debajo del cursor
set.sidescrolloff = 5                -- Dejar 5 lineas a los laterales del cursor
set.splitbelow = true                -- Open splits below the current window
set.splitright = true                -- Open splits right of the current window
set.timeoutlen = 500
set.updatetime = 300
set.inccommand = 'split'             -- Incrementally show effects of commands, opens split
set.history = 50                     -- Numero de comandos a recordar en una tabla
set.pumheight = 15                   -- Height of the pop up menu

set.list = true                      -- for plug indent-blanckline
set.undofile = true
set.ruler = false                    -- muestra el cursor todo el tiempo
set.swapfile = false                 -- Desabilidar los archivos de intercambio


vim.opt.colorcolumn:append("81")     -- Numero maximo de caracteres en linea
vim.opt.shortmess:append("c")        -- No parar mendajes a 'ins-completion-menu'

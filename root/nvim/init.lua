local options = {
   number         = true,                 -- Muestra el número de línea actual
   relativenumber = false,                -- Muertra los numeros relativos a la linea actual
   mouse          = 'nvi',                -- Habilitar el Mouse, pero no en el CMD
   encoding       = 'utf-8',              -- Codificacion mostrada
   fileencoding   = 'utf-8',              -- Codificación escrita en el archivo
   clipboard      = 'unnamedplus',        -- Copiar y pegar en portapapeles

   expandtab      = true,                 -- Usa espacios en lugar de tabulaciones
   smartindent    = true,                 -- Sangría inteligente
   smarttab       = true,                 -- Tabulacion más inteligente
   autoindent     = true,                 -- Indentado Inteligente
   shiftwidth     = 2,                    -- El ancho de cada sangria
   tabstop        = 2,                    -- Espacios por cada Tab

   wrap           = false,                -- Texto en una sola linea
   writebackup    = false,                -- No se requiere(nose)
   linebreak      = true,                 -- Romper la linea si la palabra no alcanza.
   updatetime     = 200,                  -- Completado mas rapida
   timeoutlen     = 400,

   cmdheight      = 1,                    -- Altura de la Terminal CMD
   inccommand     = 'split',              -- Muestra incrementalmente los efectos de los comandos, abre split (ideal para reemplazar)
   showmode       = false,                -- CMD message -- INSERTAR -- NORMAL -- ...
   history        = 50,                   -- Numero de comandos a recordar en una tabla

   foldlevelstart = 99,                   -- Expandir todos los pliegues por defecto
   foldtext       = 'CustomFold()',       -- Función personalizada para foldtext
   foldmethod     = 'marker',             -- Plegado con soporte de triples.
   swapfile       = false,                -- Archivos de intercambio
   undofile       = true,                 -- Establece deshacer en archivo
   viminfo        = "'1000",              -- Aumentar el tamaño del historial de archivos

   incsearch      = true,                 -- Comience a buscar antes de presionar enter
   ignorecase     = true,                 -- Necesario para smartcase
   smartcase      = true,                 -- Caso de usos en la búsqueda

   signcolumn     = 'no',                 -- Columna de signos, con un extra
   termguicolors  = true,                 -- Para personalizar el editor
   cursorline     = true,                 -- Resalta la linea donde esta el cursor
   emoji          = false,                -- visualizar emojis

   softtabstop    = 2,                    -- Insertar 2 espacios para una pestaña
   splitright     = true,                 -- Open Split vertical a la derecha
   splitbelow     = true,                 -- Open Split Horizontal debajo
   scrolloff      = 8,                    -- Dejar espacio encima o debajo del cursor
   sidescrolloff  = 8,                    -- Dejar espacio a los laterales del cursor
   list           = true,                 -- Obligatorio para el plug indent_blankline
   lazyredraw     = true,                 -- Hace que las macros sean más rápidas y evita errores en asignaciones complicadas
   laststatus     = 3,                    -- Estado global para todas las ventanas
   pumheight      = 10,                   -- Numero maximo de items de Completado
   completeopt    = {
      'menu' ,'menuone', 'noselect',      -- Completion engine options
   },

   conceallevel   = 0,                    -- Usar `` en archivos markdown
   errorbells     = false,                -- Sonido de errores
   wildignore     = '*node_modules/**',   -- No buscar dentro de los módulos de Node.js
   backspace      = {
      'indent', 'eol', 'start',           -- Asegurarse de que el backspace(<-) funcione
   },
}

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.opt.colorcolumn:append('80')          -- Numero maximo de caracteres en linea
vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');

local global_var = {
   fillchars               = 'fold:\\ ',  -- Rellene los caracteres necesarios para los pliegues
   mapleader               = ' ',         -- Map leader
   speeddating_no_mappings = 1,           -- Deshabilitar asignaciones predeterminadas para citas rápidas
   tex_flavor              = 'latex'      -- Tratar archivos .tex como LaTex y no como Tex
}

for k, v in pairs(global_var) do
   vim.g[k] = v
end


-- Edit keymaps
local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local silent = { silent = true }
local opt = { noremap = true, silent = true }

-- Moverse al primer caracter de la linea.
keymap('n', 'H', '^', silent)

-- mover el texto seleccionado Verticalmente en mode 'V'
keymap('v', 'K', ":move '<-2<CR>gv-gv", silent)
keymap('v', 'J', ":move '>+1<CR>gv-gv", silent)

-- Mover el indentado Horizontalmente en mode 'V'
keymap('v', '<', '<gv', silent)
keymap('v', '>', '>gv', silent)

-- Copiar hasta el final de la linea
keymap('n', 'Y', 'y$', opt)

-- Moverse mas rapido abajo y arriba
keymap('n', 'D', '5j', opt)
keymap('n', 'E', '5k', opt)

-- Limpiar el resultado de busqueda
keymap('n', 'm', ':nohl<CR>', opt)

-- Agregar el ';' al final de la linea seleccionada
keymap('n', '<Leader>;', '$a;', opt)

-- Redimencionar los splits con los teclados de direcciones
keymap('n', '<right>', ':vertical resize +5<CR>', opt)
keymap('n', '<left>', ':vertical resize -5<CR>', opt)
keymap('n', '<up>', ':resize +5<CR>', opt)
keymap('n', '<down>', ':resize -5<CR>', opt)

-- Scap in mode Insert and Visual
keymap('i', 'kj', '<esc>', opt)
keymap('i', 'KJ', '<esc>', opt)

-- Guardar el archivo en mode 'N' and "I"
keymap('n', '<Leader>w', ':w<CR>', silent)
keymap('i', '<C-s>', '<ESC> :w<CR>', silent)

-- eliminar un buffer
keymap('n', '<Leader>q', ':BufferClose<CR>', silent)

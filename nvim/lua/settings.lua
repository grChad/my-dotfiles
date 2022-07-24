local options = {
   number         = true,                 -- Muestra el número de línea actual
   relativenumber = false,                -- Muertra los numeros relativos a la linea actual
   mouse          = 'nvi',                -- Habilitar el Mouse, pero no en el CMD
   encoding       = 'utf-8',              -- Codificacion mostrada
   fileencoding   = 'utf-8',              -- Codificación escrita en el archivo
   clipboard      = {
      'unnamed', 'unnamedplus',              -- Copiar y pegar en portapapeles
   },

   expandtab      = true,                 -- Usa espacios en lugar de tabulaciones
   smartindent    = true,                 -- Sangría inteligente
   smarttab       = true,                 -- Tabulacion más inteligente
   autoindent     = true,                 -- Indentado Inteligente
   shiftwidth     = 2,                    -- El ancho de cada sangria
   tabstop        = 2,                    -- Espacios por cada Tab

   wrap           = false,                -- Texto en una sola linea
   linebreak      = true,                 -- Romper la linea si la palabra no alcanza.
   breakindent    = true,                 -- Para tener un indentado igual en los saltos de linea por (wrap)
   spelllang      = 'es',                 -- Establecer el idioma del corrector ortografico, por defecto es en 'ingles'
   spellsuggest   = 'best,9',             -- Muestra las 9 mejores opciones de correccion.
   writebackup    = false,                -- No se requiere(nose)
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

   signcolumn     = 'yes',              -- Columna de signos, con un extra
   termguicolors  = true,                 -- Para personalizar el editor
   cursorline     = true,                 -- Resalta la linea donde esta el cursor
   emoji          = false,                -- visualizar emojis

   showtabline    = 2,                    -- Mostrar siempre pestañas
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

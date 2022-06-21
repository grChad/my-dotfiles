local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local silent = { silent = true }
local opt = { noremap = true, silent = true }

-- Abrir al archivo de configuracion.
keymap('n', '<Leader>ed', ':e ~/.config/nvim/init.lua<CR>', opt)

-- Use F5 para refrescar el archivo de configuracion init.lua
keymap({'n', 'v', 'i' }, '<F5>', ':source ~/.config/nvim/init.lua<CR>', noremap)

-- Moverse entre ventanas como en 'Tmux'
keymap('n', '<C-h>', '<C-w>h', silent)
keymap('n', '<C-j>', '<C-w>j', silent)
keymap('n', '<C-k>', '<C-w>k', silent)
keymap('n', '<C-l>', '<C-w>l', silent)

-- Moverse al primer caracter de la linea.
keymap('n', 'H', '^', silent)

-- mover el texto seleccionado Verticalmente en mode 'V'
keymap('v', 'K', ":move '<-2<CR>gv-gv", silent)
keymap('v', 'J', ":move '>+1<CR>gv-gv", silent)

-- Desabilitar la navegacion con las flechas de direcciones
keymap({ 'n', 'v' }, '<up>', '<nop>', opt)
keymap({ 'n', 'v' }, '<down>', '<nop>', opt)
keymap({ 'n', 'v' }, '<left>', '<nop>', opt)
keymap({ 'n', 'v' }, '<right>', '<nop>', opt)

-- Guardar y salir
keymap('n', 'W', ':wq<CR>', opt)

-- Salir
keymap('n', 'Q', ':q<CR>', opt)

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
keymap('v', 'kj', '<esc>', opt)
keymap('v', 'KJ', '<esc>', opt)

-- Escapar del mode 'I', en modo 'visual' me daba un bug en el cursor
keymap('i', 'kj', '<esc>', opt)
keymap('i', 'KJ', '<esc>', opt)

-- ╭──────────────────────────────────────────────────────────╮
-- │  NOTE: Buffers                                           │
-- ╰──────────────────────────────────────────────────────────╯
-- Guardar el archivo en mode 'N' and "I"
keymap('n', '<Leader>w', ':w<CR>', silent)
keymap('i', '<C-s>', '<ESC> :w<CR>', silent)

-- eliminar un buffer
keymap('n', '<Leader>q', ':BufferClose<CR>', silent)

-- moverse entre buffers
keymap('n', '<Leader>k', ':BufferNext<CR>', silent)
keymap('n', '<Leader>j', ':BufferPrevious<CR>', silent)

-- Moverse entre los buffers con barbar.nvim
keymap('n', '<Leader>1', ':BufferGoto 1<CR>', silent)
keymap('n', '<Leader>2', ':BufferGoto 2<CR>', silent)
keymap('n', '<Leader>3', ':BufferGoto 3<CR>', silent)
keymap('n', '<Leader>4', ':BufferGoto 4<CR>', silent)
keymap('n', '<Leader>5', ':BufferGoto 5<CR>', silent)
keymap('n', '<Leader>6', ':BufferGoto 6<CR>', silent)
keymap('n', '<Leader>7', ':BufferGoto 7<CR>', silent)
keymap('n', '<Leader>8', ':BufferGoto 8<CR>', silent)
keymap('n', '<Leader>9', ':BufferGoto 9<CR>', silent)

-- vertical split
keymap('n', '<Leader>ve', ':vsp<CR>', opt)
-- horizontal split
keymap('n', '<Leader>ho', ':sp<CR>', opt)

-- Preview MarkDown
keymap('n', '<Leader>m', ':MarkdownPreviewToggle<CR>', { noremap = true })

-- Administrador de ficheros del Plug Nvim-tree
keymap('n', '<Leader><tab>', ':NvimTreeToggle<CR>', opt)
keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', opt)

-- easymotion
keymap('n', '<Leader>b', '<Plug>(easymotion-s2)', { noremap = true })

-- Comment Box
keymap({ 'n', 'v' }, "<Leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", { silent = true })

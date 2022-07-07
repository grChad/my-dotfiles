-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- NOTE: Variables: Simplifican los redundante

local map = vim.api.nvim_set_keymap
local silent = { silent = true }
local opt = { noremap = true, silent = true }

-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Llamar al archivo de configuracion.
map('n', '<Leader>ed', ':e ~/.config/nvim/init.lua<CR>', opt)
-- +--------------------------------------------------------------------+

-- Moverse entre ventanas como en 'Tmux'
map('n', '<C-h>', '<C-w>h', silent)
map('n', '<C-j>', '<C-w>j', silent)
map('n', '<C-k>', '<C-w>k', silent)
map('n', '<C-l>', '<C-w>l', silent)
-- +--------------------------------------------------------------------+

-- Moverse al primer caracter de la linea.
map('n', 'H', '^', silent)
-- +--------------------------------------------------------------------+

-- mover el texto seleccionado Verticalmente en mode 'V'
map('v', 'K', ":move '<-2<CR>gv-gv", silent)
map('v', 'J', ":move '>+1<CR>gv-gv", silent)
-- +--------------------------------------------------------------------+

-- Desabilitar la navegacion con las flechas de direcciones
map('n', '<up>', '<nop>', opt)
map('v', '<up>', '<nop>', opt)
map('n', '<down>', '<nop>', opt)
map('v', '<down>', '<nop>', opt)
map('n', '<left>', '<nop>', opt)
map('v', '<left>', '<nop>', opt)
map('n', '<right>', '<nop>', opt)
map('v', '<right>', '<nop>', opt)
-- +--------------------------------------------------------------------+

-- Salir de la ventana
map('n', 'Q', ':q<CR>', opt)
-- +--------------------------------------------------------------------+

-- Mover el indentado Horizontalmente en mode 'V'
map('v', '<', '<gv', silent)
map('v', '>', '>gv', silent)
-- +--------------------------------------------------------------------+

-- Copiar hasta el final de la linea
map('n', 'Y', 'y$', opt)
-- +--------------------------------------------------------------------+

-- Moverse mas rapido abajo y arriba
map('n', 'D', '5j', opt)
map('n', 'E', '5k', opt)
-- +--------------------------------------------------------------------+

-- Limpiar el resultado de busqueda
map('n', 'm', ':nohl<CR>', opt)
-- +--------------------------------------------------------------------+

-- Agregar el ';' al final de la linea seleccionada
map('n', '<Leader>;', '$a;', opt)
-- +--------------------------------------------------------------------+

-- Redimencionar ventanas con teclado de direcciones
map('n', '<right>', ':vertical resize +5<CR>', opt)
map('n', '<left>', ':vertical resize -5<CR>', opt)
map('n', '<up>', ':resize -5<CR>', opt)
map('n', '<down>', ':resize +5<CR>', opt)
-- +--------------------------------------------------------------------+

-- Scap in mode Insert and Visual
map('i', 'kj', '<esc>', opt)
map('i', 'KJ', '<esc>', opt)
-- +--------------------------------------------------------------------+

-- Escapar del mode 'I', en modo 'visual' me daba un bug en el cursor
map('i', 'kj', '<esc>', opt)
map('i', 'KJ', '<esc>', opt)
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │                           NOTE: Buffers                            │
-- └                                                                    ┘
-- (1) Guardar el archivo en mode 'N' and "I"
map('n', '<Leader>w', ':w<CR>', silent)
map('i', '<C-s>', '<ESC> :w<CR>', silent)
-- +--------------------------------------------------------------------+
-- (2) eliminar un buffer
map('n', '<Leader>q', ':BufferClose<CR>', silent)
-- +--------------------------------------------------------------------+
-- (3) moverse entre buffers
map('n', '<Leader>k', ':BufferNext<CR>', silent)
map('n', '<Leader>j', ':BufferPrevious<CR>', silent)
-- +--------------------------------------------------------------------+
-- (5) Split Vertical y Horizontal
map('n', '<Leader>ve', ':vsp<CR>', opt)
map('n', '<Leader>ho', ':sp<CR>', opt)
-- +--------------------------------------------------------------------+
-- (4) Moverse entre los buffers con barbar.nvim
map('n', '<Leader>1', ':BufferGoto 1<CR>', silent)
map('n', '<Leader>2', ':BufferGoto 2<CR>', silent)
map('n', '<Leader>3', ':BufferGoto 3<CR>', silent)
map('n', '<Leader>4', ':BufferGoto 4<CR>', silent)
map('n', '<Leader>5', ':BufferGoto 5<CR>', silent)
map('n', '<Leader>6', ':BufferGoto 6<CR>', silent)
map('n', '<Leader>7', ':BufferGoto 7<CR>', silent)
map('n', '<Leader>8', ':BufferGoto 8<CR>', silent)
map('n', '<Leader>9', ':BufferGoto 9<CR>', silent)
-- +--------------------------------------------------------------------+

-- Preview MarkDown
map('n', '<Leader>m', ':MarkdownPreviewToggle<CR>', { noremap = true })
-- +--------------------------------------------------------------------+

-- Nvim-tree Toggle
-- > los demas comandos estan el lua/configs/tree.lua
map('n', '<Leader><tab>', ':NvimTreeToggle<CR>', opt)
-- +--------------------------------------------------------------------+

-- easymotion
map('n', '<Leader>b', '<Plug>(easymotion-s2)', { noremap = true })
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │                         NOTE: Comment Box                          │
-- └                                                                    ┘
map('n', '<Leader>ac', "<cmd>lua require('comment-box').cbox(5)<CR>", silent)
map('v', '<Leader>ac', "<cmd>lua require('comment-box').cbox(5)<CR>", silent)
map('n', '<Leader>an', "<cmd>lua require('comment-box').cbox(18)<CR>", silent)
map('v', '<Leader>an', "<cmd>lua require('comment-box').cbox(18)<CR>", silent)
map('n', '<Leader>al', "<cmd>lua require('comment-box').line(10)<CR>", silent)
map('v', '<Leader>al', "<cmd>lua require('comment-box').line(10)<CR>", silent)
-- +--------------------------------------------------------------------+

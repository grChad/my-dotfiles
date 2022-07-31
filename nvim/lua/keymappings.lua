local map = vim.keymap.set
local silent = { silent = true }
local opts = { noremap = true, silent = true }

-- llamar al archivo de configuracion
map('n', '<Leader>/', '<cmd>e $MYVIMRC<CR>', silent)
-- Moverse entre ventanas como en 'Tmux'
map('n', '<C-h>', '<C-w>h', silent)
map('n', '<C-j>', '<C-w>j', silent)
map('n', '<C-k>', '<C-w>k', silent)
map('n', '<C-l>', '<C-w>l', silent)

-- Moverse al primer caracter de la linea.
map('n', 'H', '^', silent)

-- mover el texto seleccionado Verticalmente en mode 'V'
map('v', 'K', ":move '<-2<CR>gv-gv", silent)
map('v', 'J', ":move '>+1<CR>gv-gv", silent)

-- Desabilitar la navegacion con las flechas de direcciones
map({ 'n', 'v' }, '<up>', '<nop>', opts)
map({ 'n', 'v' }, '<down>', '<nop>', opts)
map({ 'n', 'v' }, '<left>', '<nop>', opts)
map({ 'n', 'v' }, '<right>', '<nop>', opts)

-- agreglar la sangria del documento.
map('n', '<C-f>', 'gg=G<CR>', opts)

-- Redimencionar los splits con los teclados de direcciones
map('n', '<right>', ':vertical resize +5<CR>', opts)
map('n', '<left>', ':vertical resize -5<CR>', opts)
map('n', '<up>', ':resize -5<CR>', opts)
map('n', '<down>', ':resize +5<CR>', opts)

-- Mover el indentado Horizontalmente en mode 'V'
map('v', '<', '<gv', silent)
map('v', '>', '>gv', silent)

-- Case change in visual mode
map("v", "`", "u", silent)
map("v", "<A-`>", "U", silent)


-- Escapar del mode 'I' and 'V'
map('i', 'kj', '<esc>', opts)
map('i', 'KJ', '<esc>', opts)

-- Copiar hasta el final de la linea
map('n', 'Y', 'y$', opts)

-- Copiar todo el documento
map('n', '<Leader>y', ':%y<CR>')

-- Borrar y copiar todo el documento
map('n', '<Leader>x', ':%d<CR>')

-- Moverse mas rapido abajo y arriba
map('n', 'D', '5j', opts)
map('n', 'E', '5k', opts)


-- Telescope
map('n', '<C-p>', "<CMD>lua require('plugins.telescope').project_files()<CR>")
-- keymap('n', "<S-p>", "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>")

-- Quitar los puntos destacados
map('n', 'm', ':nohl<CR>', opts)

-- Encontrar palabra/archivo en el proyecto
map('n', '<Leader>pf',
   "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")
map('n', '<Leader>pw', "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>")

-- Git
map('n', '<Leader>gla', "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", {})
map('n', '<Leader>glc', "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │  NOTE: Buffers                                           │
-- ╰──────────────────────────────────────────────────────────╯
-- Guardar el archivo en mode 'N' and "I"
map('n', '<Leader>w', ':w<CR>', silent)
map('i', '<C-s>', '<ESC> :w<CR>', silent)

-- eliminar un buffer
map('n', '<Leader>q', ':BufferClose<CR>', silent)

-- moverse entre buffers
map('n', '<Leader>k', ':BufferNext<CR>', silent)
map('n', '<Leader>j', ':BufferPrevious<CR>', silent)

-- Move between barbar buffers
map('n', '<Leader>1', ':BufferGoto 1<CR>', silent)
map('n', '<Leader>2', ':BufferGoto 2<CR>', silent)
map('n', '<Leader>3', ':BufferGoto 3<CR>', silent)
map('n', '<Leader>4', ':BufferGoto 4<CR>', silent)
map('n', '<Leader>5', ':BufferGoto 5<CR>', silent)
map('n', '<Leader>6', ':BufferGoto 6<CR>', silent)
map('n', '<Leader>7', ':BufferGoto 7<CR>', silent)
map('n', '<Leader>8', ':BufferGoto 8<CR>', silent)
map('n', '<Leader>9', ':BufferGoto 9<CR>', silent)

-- Administrador de ficheros del Plug Nvim-tree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- vertical split
map('n', '<Leader>ve', ':vsp<CR>', opts)
-- horizontal split
map('n', '<Leader>ho', ':sp<CR>', opts)

-- Don't yank on delete char
map({ 'n', 'v' }, 'x', '"_x', silent)
map({ 'n', 'v' }, 'X', '"_X', silent)

-- Don't yank on visual paste
map('v', 'p', "'_dP", silent)

-- Evite los problemas debido al renombrado <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
map('n', '<Space>,', ':cp<CR>', silent)
map('n', '<Space>.', ':cn<CR>', silent)

-- Toggle quicklist
--keymap('n', "<Leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Easyalign
map('n', 'ga', '<Plug>(EasyAlign)', silent)
map('x', 'ga', '<Plug>(EasyAlign)', silent)

-- Invocar manualmente speeddating en caso de switch.vim no funcione
map('n', '<C-a>', ':if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>', silent)
map('n', '<C-x>', ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
   silent)

-- Enlaces abiertos bajo cursor en el navegador con gx
if vim.fn.has('macunix') == 1 then
   map('n', 'gx', "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
   map('n', 'gx', "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- LSP
-- keymap('n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
map('n', 'rf', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>', silent)
map('n', '<C-Space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', silent)
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', silent)
map('v', '<Leader>ca', "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
map('n', '<Leader>re', "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
map('n', '<Leader>cf', "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
map('v', '<Leader>cf', "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
map('n', '<Leader>d', "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
map('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
map('n', 'L', "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
map('n', ']g', "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
map('n', '[g', "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)

-- Comment Box
map({ 'n', 'v' }, '<Leader>ac', "<cmd>lua require('comment-box').cbox(5)<CR>", silent)
map({ 'n', 'v' }, '<Leader>an', "<cmd>lua require('comment-box').cbox(18)<CR>", silent)
map({ 'n', 'v' }, '<Leader>al', "<cmd>lua require('comment-box').line(10)<CR>", silent)
-- +--------------------------------------------------------------------+

-- Traductor de Pantran
map({ 'n', 'v' }, '<Leader>tr', ':Pantran mode=append target=es<CR>', opts)

-- Para formatear con Prettier
map('n', '<leader>p', ':silent !npx prettier --write %<CR>')

set mouse=a
set number
set rnu
set clipboard=unnamedplus
set noerrorbells
set cursorline
set colorcolumn=80

set numberwidth=4
set shiftwidth=3
set tabstop=3
set autoindent
set expandtab
set smarttab
set smartindent

set incsearch
set ignorecase
set smartcase

set encoding=utf-8
set display+=lastline
set wrap
"set nowrap
set linebreak

set noswapfile
set nobackup
set undodir=~/root/.config/.undodir_nvim/
set undofile

set pumheight=10
set  conceallevel=0
set formatoptions-=cro
set whichwrap+=<,>,[,]

set noshowmode
set cmdheight=1



"map leader"
let mapleader = " "

"negar las flechas de direcciones"
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"Redimencionar las ventanas
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"para guardar cambios
nnoremap <leader>w :w<CR>

"Para cambiar el estado a modo normal
imap kj <ESC>

"limpiar la busqueda seleccionada
nnoremap <silent>m :noh<CR>

"Agregar el ';' al final de la linea
nnoremap <leader>; $a;<ESC>

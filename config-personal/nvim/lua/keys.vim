"Abrir al archivo de configuracion en cualquier momento
nnoremap <leader>ed :e /home/gabriel/.config/nvim/init.lua<Cr>

"Use F5 to refresh your editor with the config file that you specify here
nmap <F5> :source ~/.config/nvim/init.lua<Cr>
vmap <F5> :source ~/.config/nvim/init.lua<Cr>

"Desabilitar la navegacion con las flechas de direcciones
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"With the arrow keys you can resize your splits
nnoremap <silent> <right> :vertical resize +5<Cr>
nnoremap <silent> <left> :vertical resize -5<Cr>
nnoremap <silent> <up> :resize +5<Cr>
nnoremap <silent> <down> :resize -5<Cr>

" Save file
nnoremap <leader>w :write<Cr>

" Delete Buffer
nnoremap <leader>q :bdelete<Cr>

" Moverse mas rapido abajo y arriba
nnoremap <leader>, J<Cr>
nnoremap <silent>J 5j<Cr>
nnoremap <silent>K 5k<Cr>

" clear search results
nnoremap <silent>m :noh<Cr>

"Agregar el ';' al final de la linea seleccionada
nnoremap <silent><leader>; $a;<Esc>

" Format files 'css', and 'scss' with stylelint. -----------------------------
" Format files 'javascript' and 'javascriptreact', whith eslint -------------
function FormatFiles()
    if (&ft == 'javascript' || &ft == 'javascriptreact')
        silent !npx eslint --fix %
    elseif (&ft == 'typescript')
        silent !npm run fix %
    elseif (&ft == 'css' || &ft == 'scss')
        silent !npx stylelint --fix %
    endif
endfunction
noremap <leader>fi :call FormatFiles()<Cr>


" Run current file 'node', 'lua', 'rustc' -----------------------------------
function RunFile()
    if &ft == 'javascript'
        !node %
    elseif &ft == 'lua'
        !lua %
    elseif &ft == 'rust'
        !cargo run
    elseif &ft == 'typescript'
        !tsc
    endif
endfunction
noremap <leader>c :call RunFile()<Cr>

" para compilar 'love2d' & deno -------------------------------------------------
function RunOther()
    if &ft == 'lua'
        !love .
    endif
endfunction
noremap <leader>lo :call RunOther()<Cr>

" function for wrap and indent whith space --------------------------------
function SetWrap()
    set wrap
    set linebreak                  " Si la palabra no alcanza el espacio se corre a la linea seguiente.
    set breakindent
    let &showbreak='  '              " El espacio adicional respecto al inicio de la linea
endfunction
noremap <leader>id :call SetWrap()<Cr>


" Preview MarkDown -------------------------------------------------------
noremap<leader>ma :MarkdownPreview<Cr>

"vertical split
nnoremap <leader>ve :vsp<Cr>

"horizontal split
nnoremap <leader>ho :sp<Cr>

" Navegar entre buffers
nnoremap <leader>j :bprevious<Cr>
nnoremap <leader>k :bnext<Cr>

" Plegado persistente automatizado pata vim, ':mkview' y ':loadview'.
" autocmd BufWinLeave *.*  mkview
" autocmd BufWinEnter *.* silent loadview

set foldtext=getline(v:foldstart)  " Para elininar informacion de las lineas en el plieguie

" Administrador de ficheros del Plug Nvim-treek -------------------------------
"FIXME: Nvim-tree
nnoremap <leader><tab> :NvimTreeToggle<Cr>
nnoremap <leader>r :NvimTreeRefresh<Cr>
nnoremap <leader>n :NvimTreeFindFile<Cr>

" Telescope -------------------------------------------------------------------
nnoremap <leader>tt :Telescope find_files<Cr>

" Plug FixCursorHold ----------------------------------------------------------
" para mejorar el rendimiento en plugs como web-devicons, coc y mas. Es bastante efectivo....
let g:cursorhold_updatetime = 100         " En milisegundos, utilizado tanto para CursorHold como para CursorHoldI,

" easymotion ------------------------------------------------------------------
nmap <leader>b <Plug>(easymotion-s2)

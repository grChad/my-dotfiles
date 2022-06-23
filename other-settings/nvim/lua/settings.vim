" OPCION DE INTERFAS DE USUARIO ----------------------------------
set noerrorbells
set colorcolumn=90          " Limitacion visual para escribir en horizontal

" OPCION DE INDENTACION ------------------------------------------

" OPCION DE BUSQUEDA ---------------------------------------------
set incsearch                  " Mejora la busqueda con datos parciales

" OPCION DE RENDERIZADO DE TEXTO ---------------------------------
set foldmethod=manual          " Para plegar y desplegar contenido de lineas de texto.
set encoding=utf-8             " Codificacion compatible con Unicode
set display+=lastline          " Tratar de mostrar la ultima linea de un parrafo

" OPTIONS OTHERS -------------------------------------------------
" Para no depender de los archivos de intercambio y de respaldo.
set shortmess+=c               " Don't pass messages to 'ins-completion-menu'.

set noswapfile                 " Desabilita los archivos de intercambio
set nobackup                   " Uso recomendado por Coc
set nowritebackup              " Uso recomendado por Coc
set undodir=~/.config/.undodir_nvim/

set pumheight=10               " Para que el menu emergente sea mas pequenho.
set conceallevel=0             " Para visualizar archivos markdown.
set formatoptions-=cro         " Detener la continuación de comentarios de nueva línea.
set whichwrap+=<,>,[,]         " Detener la continuacion de comentarios de nueva linea.

" Para establecer las direcciones de los Splits
set splitbelow                 " Las diviciones horizontales estaran automaticamente debajo
set splitright                 " Las diviciones verticales estaran automaticamente a la derecha

" Condicional para el indentado en algunos documentos.
let defaultFileTypes = &ft == 'vim' || &ft == 'gdscript3' || &ft == 'xml' || &ft == 'lua'
if defaultFileTypes
    set tabstop=4
    set shiftwidth=4
endif

function SetSpacing()
    set tabstop=4
    set shiftwidth=4
endfunction
autocmd FileType vim :call SetSpacing()
autocmd FileType lua :call SetSpacing()
autocmd FileType gdscript3 :call SetSpacing()
autocmd FileType xml :call SetSpacing()
autocmd FileType groovy :call SetSpacing()

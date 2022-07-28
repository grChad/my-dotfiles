" Format files 'css', and 'scss' with stylelint. -----------------------------
" Format files 'javascript' and 'javascriptreact', whith eslint -------------
function FormatFiles()
   if (&ft == 'javascript' || &ft == 'javascriptreact')
      silent !npx eslint --fix %
   elseif (&ft == 'typescript' || &ft == 'typescriptreact')
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
      !lua-language-server %
   elseif &ft == 'rust'
      !cargo run
   elseif &ft == 'typescript'
      !tsc
   elseif &ft == 'python'
      !python3 %
   endif
endfunction
noremap <leader>co :call RunFile()<Cr>

" para compilar 'love2d' & deno -------------------------------------------------
function RunOther()
   if &ft == 'lua'
      !love .
   endif
endfunction
noremap <leader>lo :call RunOther()<Cr>

" Para formatear con prettier
noremap <leader>p :silent !npx prettier --write %<CR>

" Para eliminar el encadenamiento de sangrias en js
let g:javascript_opfirst = 1

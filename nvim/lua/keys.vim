" NOTE: Para formatear con 'eslint', 'stylelint'
function FormatFiles()
   if (&ft == 'javascript' || &ft == 'javascriptreact')
      silent !npx eslint --fix %
   elseif (&ft == 'typescript' || &ft == 'typescriptreact')
      silent !npx eslint --fix %
   elseif (&ft == 'css' || &ft == 'scss')
      silent !npx stylelint --fix %
   endif
endfunction
noremap <leader>fi :call FormatFiles()<Cr>

" NOTE: Para correr en la CMD de NVim 'node', 'lua', 'rustc'
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

" NOTE: para compilar 'love2d'
function RunOther()
   if &ft == 'lua'
      !love .
   endif
endfunction
noremap <leader>lo :call RunOther()<Cr>

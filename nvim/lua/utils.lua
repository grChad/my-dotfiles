-- Para que los comentarios no se repitan
vim.cmd([[ autocmd! BufEnter * set fo-=r fo-=o ]])

require('onedark').setup({
   dark_float = false,                -- Ventanas flotantes mas oscuras
   hide_inactive_statusline = true,   -- Nvim Tree background, mas oscuro
   dark_sidebar = true,               -- Linea de numeros y signos mas oscuras
   highlight_linenumber = true,       -- linea de numeros y signos mas oscuras.

   overrides = function ()
      return {
         Visual = { style = 'inverse' }
      }
   end,
   dev = true,
})

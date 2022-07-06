require('onedark').setup({
   dark_float = false,                -- Ventanas flotantes mas oscuras
   hide_inactive_statusline = true,   -- Nvim Tree background, mas oscuro
   dark_sidebar = true,               -- Linea de numeros y signos mas oscuras

   overrides = function ()
      return {
         Visual = { style = 'inverse' }
      }
   end,
   dev = true,
})

vim.highlight.create('NormalFloat', { guibg='none', guifg='none' }, false)
vim.highlight.create('FloatBorder', { guibg='none' }, false)
vim.highlight.create('WhichKeyFloat', { guibg='none' }, false)
vim.highlight.create('BufferTabpageFill', { guibg='none' }, false)
vim.highlight.create('VertSplit', { guifg='#5C6370' }, false)

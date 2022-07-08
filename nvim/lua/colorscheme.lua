require('onedark').setup({
   dark_float = false,                -- Ventanas flotantes mas oscuras
   hide_inactive_statusline = true,   -- Nvim Tree background, mas oscuro
   dark_sidebar = true,               -- Linea de numeros y signos mas oscuras

   overrides = function ()            -- Para obtener colores inversos al seleccionar
      return {
         Visual = { style = 'inverse' }
      }
   end,
   dev = true,
})
-- +--------------------------------------------------------------------+

local create = vim.highlight.create

create('NormalFloat', { guibg='none', guifg='none' }, false)
create('FloatBorder', { guibg='none' }, false)
create('WhichKeyFloat', { guibg='none' }, false)
create('BufferTabpageFill', { guibg='none' }, false)
create('VertSplit', { guifg='#5C6370' }, false)
create('BufferOffset', { guifg = '#FFA630' }, true);

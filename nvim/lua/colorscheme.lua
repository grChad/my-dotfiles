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
-- Colores personalizablas
local colors = {
   nvimtree_title       = '#FFA630',
   nvimtree_root_folder = '#E86671',
   primary              = '#61AFEF',
   border_gray          = '#5C6370',
   folder_icon          = '#DAA520',
   folder_name_close    = '#DAA520',
   folder_name_open     = '#A0522D',
}

-- +--------------------------------------------------------------------+
local create = vim.highlight.create

create('NormalFloat', { guibg='none', guifg='none' }, false)
create('FloatBorder', { guibg='none' }, false)
create('WhichKeyFloat', { guibg='none' }, false)
create('BufferTabpageFill', { guibg='none' }, false)
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │            HACK: NvimTree Color de Folder y FolderName             │
-- └                                                                    ┘
create('BufferOffset', { guifg= colors.nvimtree_title }, true);
vim.cmd('highlight NvimTreeFolderIcon guifg=' .. colors.folder_icon)
vim.cmd('highlight NvimTreeFolderName guifg=' .. colors.folder_name_close)
vim.cmd('highlight NvimTreeOpenedFolderName guifg=' .. colors.folder_name_open)
vim.cmd('highlight NvimTreeIndentMarker guifg=' .. colors.primary)
vim.cmd('highlight NvimTreeRootFolder guifg=' .. colors.nvimtree_root_folder)

create('VertSplit', { guifg = colors.primary }, false)
vim.cmd('highlight WinSeparator guibg=None guifg=' .. colors.primary)
-- +--------------------------------------------------------------------+


-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
local v_create = vim.highlight.create
local v_link   = vim.highlight.link
-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Colores personalizablas
local colors = {
   first_color          = '#FFA630',
   second_color         = '#61AFEF',
   tird_color           = '#488DFF',
   fourth_color         = '#E86671',
   border_gray          = '#5C6370',
   folder_icon          = '#DAA520',
   folder_name_close    = '#DAA520',
   folder_name_open     = '#A0522D',
}
-- highlight Personalizados
v_create('FirstColor', { gui = 'bold', guifg = colors.first_color }, false)
v_create('TirdColor', { gui = 'bold', guifg = colors.tird_color }, false);
v_create('FourthColor', { gui = 'bold', guifg = colors.fourth_color }, false);
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │                             NvimTree:                              │
-- │    Color de la barra de Titulo, folder_root, icono de folders,     │
-- │    nombre del folder abierto, folder cerrado y los indentados,     │
-- │                  tambien el separador de ventana                   │
-- └                                                                    ┘
v_create('BufferOffset', { guifg= colors.first_color }, true);
vim.cmd('highlight NvimTreeRootFolder guifg=' .. colors.fourth_color)
vim.cmd('highlight NvimTreeFolderIcon guifg=' .. colors.folder_icon)
vim.cmd('highlight NvimTreeFolderName guifg=' .. colors.folder_name_close)
vim.cmd('highlight NvimTreeOpenedFolderName guifg=' .. colors.folder_name_open)
vim.cmd('highlight NvimTreeIndentMarker guifg=' .. colors.second_color)
v_create('VertSplit', { guifg = colors.second_color }, false)
-- +--------------------------------------------------------------------+

-- separador de Splits
vim.cmd('highlight WinSeparator guibg=None guifg=' .. colors.second_color)
-- +--------------------------------------------------------------------+

-- barra de numeros
v_create('CursorLineNR', { guifg = colors.first_color }, false)
v_link('LineNr', 'Comment', false)
-- +--------------------------------------------------------------------+

 -- -- Telescope
 -- vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
 -- vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
 -- vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
 -- vim.highlight.link('TelescopeMatching', 'Constant', true);
-- +--------------------------------------------------------------------+

-- Misc
-- vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
-- vim.highlight.create('StatusLine', { guibg = "None" }, false);
-- vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
-- vim.highlight.create('rainbowcol1', { guifg = '#F7768E', ctermfg = 9 }, false);
vim.highlight.create('Boolean', { guifg = '#F7768E' }, false);
-- +--------------------------------------------------------------------+

-- otros
v_create('NormalFloat', { guibg='none', guifg='none' }, false)
v_create('FloatBorder', { guibg='none' }, false)
v_create('WhichKeyFloat', { guibg='none' }, false)
v_create('BufferTabpageFill', { guibg='none' }, false)
-- +--------------------------------------------------------------------+

-- Menu de completado Cmd
local highlights = {
   -- CmpItemAbbr
   -- CmpItemKindClass
   -- CmpItemKindConstructor
   -- CmpItemKindFolder
   -- CmpItemKindFunction
   -- CmpItemKindInterface
   -- CmpItemKindKeyword
   -- CmpItemKindMethod
   -- CmpItemKindReference
   CmpItemKindSnippet     = { fg = '#15B27B' },
   CmpItemKindVariable    = { fg = '#E86671', bg = "NONE" },
   CmpItemKindText        = { fg = '#D3D3D3' },
   CmpItemMenu            = { fg = '#FFA630', bg = "NONE" },
   CmpItemAbbrMatch       = { fg = '#61AFEF', bg = "NONE" },
   CmpItemAbbrMatchFuzzy  = { fg = '#61AFEF', bg = "NONE" },
}

vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = '#90CFB0' })

for group, hl in pairs(highlights) do
   vim.api.nvim_set_hl(0, group, hl)
end

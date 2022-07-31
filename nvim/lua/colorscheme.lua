-- Theme 'catppuccin'
-- > Latte: es el thema claro
-- > frappe, macchiato, mocha: van desde poco oscuro hasta muy oscuro.
vim.g.catppuccin_flavour = 'frappe'
require("catppuccin").setup({
   styles = {
      numbers = { 'bold' },
      booleans = { 'bold' },
   },
   integrations = {
      native_lsp = {
         enabled = true,
         virtual_text = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
         },
      },
      barbar = true,
      ts_rainbow = true,
   }
})
vim.cmd [[colorscheme catppuccin]]

-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
local api_nvim_set = vim.api.nvim_set_hl
-- local v_link   = vim.highlight.link
-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Colores personalizablas
local colors = {
   first_color       = '#FFA630',
   second_color      = '#61AFEF',
   tird_color        = '#488DFF',
   fourth_color      = '#E86671',
   border_gray       = '#5C6370',
   folder_icon       = '#DAA520',
   folder_name_close = '#DAA520',
   folder_name_open  = '#A0522D',
}
-- highlight Personalizados
api_nvim_set(0, 'FirstColor', { fg = colors.first_color })
api_nvim_set(0, 'TirdColor', { fg = colors.tird_color });
api_nvim_set(0, 'FourthColor', { fg = colors.fourth_color });
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │                             NvimTree:                              │
-- │    Color de la barra de Titulo, folder_root, icono de folders,     │
-- │    nombre del folder abierto, folder cerrado y los indentados,     │
-- │                  tambien el separador de ventana                   │
-- └                                                                    ┘
api_nvim_set(0, 'BufferOffset', { fg = colors.first_color });
vim.cmd('highlight NvimTreeRootFolder guifg=' .. colors.fourth_color)
vim.cmd('highlight NvimTreeFolderIcon guifg=' .. colors.folder_icon)
vim.cmd('highlight NvimTreeFolderName guifg=' .. colors.folder_name_close)
vim.cmd('highlight NvimTreeOpenedFolderName guifg=' .. colors.folder_name_open)
vim.cmd('highlight NvimTreeIndentMarker guifg=' .. colors.second_color)
api_nvim_set(0, 'VertSplit', { fg = colors.second_color })
-- +--------------------------------------------------------------------+


-- barra de numeros
api_nvim_set(0, 'CursorLineNR', { fg = colors.first_color })
-- v_link('LineNr', 'Comment', false)
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
api_nvim_set(0, 'Boolean', { fg = '#F7768E' });
-- +--------------------------------------------------------------------+

-- otros
api_nvim_set(0, 'NormalFloat', { bg = 'none', fg = 'none' })
api_nvim_set(0, 'FloatBorder', { bg = 'none' })
api_nvim_set(0, 'WhichKeyFloat', { bg = 'none' })
api_nvim_set(0, 'BufferTabpageFill', { bg = 'none' })
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
   CmpItemKindSnippet    = { fg = '#15B27B' },
   CmpItemKindVariable   = { fg = '#E86671', bg = "NONE" },
   CmpItemKindText       = { fg = '#D3D3D3' },
   CmpItemMenu           = { fg = '#FFA630', bg = "NONE" },
   CmpItemAbbrMatch      = { fg = '#61AFEF', bg = "NONE" },
   CmpItemAbbrMatchFuzzy = { fg = '#61AFEF', bg = "NONE" },
}

vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = '#90CFB0' })

for group, hl in pairs(highlights) do
   vim.api.nvim_set_hl(0, group, hl)
end

-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
local api_nvim_set = vim.api.nvim_set_hl
-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Colores personalizablas
local colors = {
   first_color     = '#FFA630',
   second_color    = '#61AFEF',
   tird_color      = '#488DFF',
   fourth_color    = '#E86671',
   fifth_color     = '#3EB050',
   border_gray     = '#5C6370',
   folder_icon     = '#DAA520',
   folder_name     = '#DAA520',
   text_commentary = '#7A809B',
}

if vim.fn.has("nvim-0.8") then
   -- highlight Personalizados
   api_nvim_set(0, 'FirstColor', { fg = colors.first_color })
   api_nvim_set(0, 'SecondColor', { fg = colors.second_color });
   api_nvim_set(0, 'FourthColor', { fg = colors.fourth_color });
   api_nvim_set(0, 'FifthColor', { fg = colors.fifth_color })
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
   --vim.cmd('highlight NvimTreeFolderName guifg=' .. colors.folder_name_close)
   vim.cmd('highlight NvimTreeOpenedFolderName guifg=' .. colors.folder_name)
   vim.cmd('highlight NvimTreeIndentMarker guifg=' .. '#464B5E')
   -- api_nvim_set(0, 'VertSplit', { fg = colors.second_color })
   -- +--------------------------------------------------------------------+

   -- barra de numeros
   api_nvim_set(0, 'CursorLineNR', { fg = colors.first_color })
   api_nvim_set(0, 'LineNr', { fg = '#606681' })

   -- Floats/Windows
   api_nvim_set(0, 'NormalFloat', { bg = "None", fg = "None" });
   api_nvim_set(0, 'FloatBorder', { bg = "None", fg = "#488DFF" });
   api_nvim_set(0, 'WhichKeyFloat', { bg = "None", fg = "#488DFF" });
   api_nvim_set(0, 'BufferTabpageFill', { fg = "None" });
   api_nvim_set(0, 'VertSplit', { bg = "None", fg = "#16161e" });
   api_nvim_set(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

   -- Telescope
   api_nvim_set(0, 'TelescopeTitle', { fg = colors.first_color });
   api_nvim_set(0, 'TelescopeNormal', { bg = "None", fg = "None" });
   api_nvim_set(0, 'TelescopeBorder', { bg = "None", fg = "#488DFF" });
   api_nvim_set(0, 'TelescopeMatching', { link = 'Constant' });

   -- Misc
   api_nvim_set(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
   api_nvim_set(0, 'Boolean', { fg = '#F7768E' });
   api_nvim_set(0, 'Comment', { fg = colors.text_commentary })

   -- Completado de colores cmp
   local highlights = {
      --CmpItemAbbr            = { fg = tokyonight_colors.dark3, bg = "NONE" },
      --CmpItemKindClass       = { fg = tokyonight_colors.orange },
      --CmpItemKindConstructor = { fg = tokyonight_colors.purple },
      --CmpItemKindFolder      = { fg = tokyonight_colors.blue2 },
      --CmpItemKindFunction    = { fg = tokyonight_colors.blue },
      --CmpItemKindInterface   = { fg = tokyonight_colors.teal, bg = "NONE" },
      --CmpItemKindKeyword     = { fg = tokyonight_colors.magneta2 },
      --CmpItemKindMethod      = { fg = tokyonight_colors.red },
      --CmpItemKindReference   = { fg = tokyonight_colors.red1 },
      CmpItemKindSnippet    = { fg = '#15B27B' },
      CmpItemKindVariable   = { fg = '#E86671', bg = "NONE" },
      CmpItemKindText       = { fg = '#D3D3D3' },
      CmpItemMenu           = { fg = '#FFA630', bg = "NONE" },
      CmpItemAbbrMatch      = { fg = '#61AFEF', bg = "NONE" },
      CmpItemAbbrMatchFuzzy = { fg = '#61AFEF', bg = "NONE" },
   }

   api_nvim_set(0, "CmpBorderedWindow_FloatBorder", { fg = '#488DFF' })

   for group, hl in pairs(highlights) do
      api_nvim_set(0, group, hl)
   end
end

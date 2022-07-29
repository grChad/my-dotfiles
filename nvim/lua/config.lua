local icons = require('icons')

EcoVim = {
   ui = {
      float = {
         border = 'rounded'
      }
   },
   plugins = {
      completion = {
         select_first_on_enter = false
      },
      rooter = {
         patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
      },
      zen = {
         kitty_enabled = false,
         enabled = true, -- sync after change
      },
   },
   icons = icons,
   statusline = {
      path_enabled = true,
      path = 'relative' -- absolute/relative
   },
   lsp = {
      virtual_text = true, -- para el plugin de diagnostics
   },
}

-- para ejecutar por consola
local lang_maps = {
   javascript = { build = 'node %' },
   typescript = { build = 'tsc'},
   lua        = { build = 'lua-language-server %' },
   rust       = { build = 'cargo run' },
   python     = { build = 'python3 %' },
}

for lang, data in pairs(lang_maps) do
   vim.api.nvim_create_autocmd(
      'FileType',
      { command = 'nnoremap <Leader>co :!' .. data.build .. '<CR>', pattern = lang}
   )
end
-- +--------------------------------------------------------------------+
-- Para formatear el documento
local lang_format = {
   javascript      = { format = 'npx eslint --fix %' },
   javascriptreact = { format = 'npx eslint --fix %' },
   typescript      = { format = 'npx eslint --fix %' },
   typescriptreact = { format = 'npx eslint --fix %' },
   css             = { format = 'npx stylelint --fix %'},
   scss            = { format = 'npx stylelint --fix %'},
}

for lang, data in pairs(lang_format) do
   vim.api.nvim_create_autocmd(
      'FileType',
      { command = 'nnoremap <Leader>fi :silent !' .. data.format .. '<CR>', pattern = lang}
   )
end


-- para ejecutar love2D
vim.api.nvim_create_autocmd(
   'FileType',
   { command = 'nnoremap <Leader>lo :!love .', pattern = 'lua'}
)

local add_cmd = vim.api.nvim_create_autocmd
-- Highlight al copiar algo
add_cmd('TextYankPost', { callback = function()
   vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
end })

-- Desabilitar el Diagnostico en 'node_modules(0 es el buffer actual)'
add_cmd('BufRead', {
   pattern = '*/node_modules/*',
   command = 'lua vim.diagnostic.disable(0)'
})
add_cmd("BufNewFile", {
   pattern = '*/node_modules/*',
   command = 'lua vim.diagnostic.disable(0)'
})

-- Para formatear el archivo al guardar
-- add_cmd('BufWritePre', {
--    pattern = {
--       '*.json', '*.js', '*.jsx', '*.ts', '*.tsx', '*.lua', '*.vim', '*.md',
--       '*.svelte'
--    },
--    command = 'lua vim.lsp.buf.formatting()'
-- })

local augroups = {}

-- NOTE: Eliminar linear porteriores al guardar, al final de la linea y al final del documento
augroups.buf_write_pre = {
   mkdir_before_saving = {
      event = { "BufWritePre", "FileWritePre" },
      pattern = "*",
      -- NOTE: Replace vimscript function
      command = [[ silent! call mkdir(expand("<afile>:p:h"), "p") ]],
   },
   trim_extra_spaces_and_newlines = {
      event = "BufWritePre",
      pattern = "*",
      -- NOTE: Replace vimscript function
      command = [[
      let current_pos = getpos(".")
      silent! %s/\v\s+$|\n+%$//e
      silent! call setpos(".", current_pos)
      ]],
   },
}

-- NOTE: Para agregar el texto con wrap y con tabulacion.
augroups.prose = {
   wrap = {
      event = 'Filetype',
      pattern = { 'markdown', 'tex', 'html' },
      callback = function()
         vim.opt_local.wrap = true
         vim.opt_local.breakindentopt = 'shift:0'
      end,
   },
   wrap_showbreak = {
      event = 'Filetype',
      pattern = { 'json', 'css', 'scss' },
      callback = function()
         vim.opt_local.wrap = true
         vim.opt_local.breakindentopt = 'shift:2'
      end,
   }
}


-- NOTE: Para agregar indentado personalizado
augroups.indent_spaces = {
   three_space = {
      event = 'Filetype',
      pattern = { 'lua', 'vim', 'css', 'json' },
      callback = function()
         vim.opt_local.tabstop = 3
         vim.opt_local.shiftwidth = 3
      end
   },
   four_space = {
      event = 'Filetype',
      pattern = { 'xml', 'groovy' },
      callback = function()
         vim.opt_local.tabstop = 4
         vim.opt_local.shiftwidth = 4
      end
   }
}

-- Para eliminar el encadenamiento de sangrias en js
augroups.for_language = {
   for_javascript = {
      event = 'Filetype',
      pattern = { 'javascript' },
      callback = function()
         vim.cmd([[let g:javascript_opfirst = 1]])
      end
   },
   for_markdown = {
      event = 'Filetype',
      pattern = { 'markdown' },
      callback = function()
         vim.cmd([[let g:mkdp_auto_close = 0]])
      end
   },
   for_all = {
      event = 'Filetype',
      pattern = '*',
      callback = function()
         vim.opt.formatoptions:remove('c');
         vim.opt.formatoptions:remove('r');
         vim.opt.formatoptions:remove('o');
      end
   },
}

for group, commands in pairs(augroups) do
   local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

   for _, opts in pairs(commands) do
      local event = opts.event
      opts.event = nil
      opts.group = augroup
      add_cmd(event, opts)
   end
end

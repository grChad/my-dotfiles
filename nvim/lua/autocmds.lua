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

-- Revision ortografica en cierto tipo de archivos: (en ingles)
add_cmd({ 'BufRead', 'BufNewFile' }, {
   pattern = { '*.txt', '*.md', '*.tex' },
   command = 'setlocal spell'
})

-- Para formatear el archivo al guardar
add_cmd('BufWritePre', {
   pattern = {
      '*.json', '*.js', '*.jsx', '*.ts', '*.tsx', '*.lua', '*.vim', '*.md',
      '*.svelte'
   },
   command = 'lua vim.lsp.buf.format(nil, 1000)'
})

-- +--------------------------------------------------------------------+

-- Winbar (for nvim 0.8+)
if vim.fn.has('nvim-0.8') == 1 then
   add_cmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
      callback = function()
         local winbar_filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
            "TelescopePrompt",
            "DressingInput",
            "DressingSelect",
            "neotest-summary",
         }

         if (vim.api.nvim_win_get_config(0).relative ~= "") then
            return
         end

         if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
            vim.opt_local.winbar = nil
            return
         end

         if vim.bo.filetype == 'GitBlame' then
            local hl_group = "FirstColor"
            vim.opt_local.winbar = " " .. "%#" .. hl_group .. "#" .. require('icons').git .. "Blame" .. "%*"
            return
         end

         local present, winbar = pcall(require, "winbar")
         if not present or type(winbar) == "boolean" then
            vim.opt_local.winbar = nil
            return
         end

         local value = winbar.gps()

         if value == nil then
            value = winbar.filename()
         end

         vim.opt_local.winbar = value
      end,
   })
end

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
      pattern = { 'lua', 'vim' },
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
augroups.javascript_custom = {
   sangria = {
      event = 'Filetype',
      pattern = { 'javascript' },
      callback = function()
         vim.cmd([[let g:javascript_opfirst = 1]])
      end
   }

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

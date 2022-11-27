local silent = { silent = true }
local noremap = { noremap = true }
local opts = { noremap = true, silent = true }

function Cmd(str)
   return "<cmd>" .. str .. "<CR>"
end

local M = {}

M.general = {
   n = {
      ["<leader>w"] = { Cmd("write"), "Save buffer", noremap },
      ["m"] = { Cmd("nohl"), "Descomentar", silent },
   },
   i = {
      ["kj"] = { "<esc>", "Escap", silent },
      ["KJ"] = { "<esc>", "Escap", silent },
   },
}

M.buffer = {
   n = {
      ["<leader>q"] = { Cmd("bdelete"), "Delete Buffer", opts },
      ["<leader>k"] = { Cmd("bn"), "Next Buffer", opts },
      ["<leader>j"] = { Cmd("bp"), "Previous Buffer", opts },
   },
}

M.plugins = {
   n = {
      -- Treesitter Playground
      ["<leader>mo"] = { Cmd("TSHighlightCapturesUnderCursor"), "view groups highlight" },
      -- Lsp
      ["rf"] = { Cmd("lua vim.lsp.buf.references({ includeDeclaration = false })") },
      ["<C-Space>"] = { Cmd("lua vim.lsp.buf.code_action()") },
      ["<leader>ca"] = { Cmd("lua vim.lsp.buf.code_action()") },
      ["<leader>re"] = { Cmd("lua vim.lsp.buf.rename()") },
      ["<C-p>"] = { Cmd("lua vim.lsp.buf.format({ async = true })") },
      ["K"] = { Cmd("lua vim.lsp.buf.hover()") },
      ["L"] = { Cmd("lua vim.lsp.buf.signature_help()") },
   },
   v = {
      -- Lsp
      ["<leader>ca"] = { Cmd("'<,'>lua vim.lsp.buf.range_code_action()") },
      ["<C-p>"] = { Cmd("'<.'>lua vim.lsp.buf.range_formatting()") },
   },
}

M.special = {
   n = {
      -- Toggle para habilitar 'spell'
      ["<F11>"] = { Cmd("lua require('custom.utils.functions').spell_toggle()"), silent },

      -- Numero de coincidencias seleccionadas
      ["n"] = { "nzz" .. Cmd("lua require('custom.utils.functions').hl_search(0.1)") },
      ["N"] = { "Nzz" .. Cmd("lua require('custom.utils.functions').hl_search(0.1)") },

      -- Toggle para booleanos: true|false, on|off, yes|no
      ["<leader>b"] = { Cmd("lua require('custom.utils.functions').toggle_bool()") },
   },
}

return M

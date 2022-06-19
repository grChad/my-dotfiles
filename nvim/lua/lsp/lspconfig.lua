local nvim_lsp = require('lspconfig')
if not nvim_lsp then
   return
end

-- for godor and more...
-- local util = require 'lspconfig.util'
local servers = {
   'tsserver', 'emmet_ls', 'html', 'cssls', 'jsonls', 'eslint', 'stylelint_lsp',
   'sumneko_lua', 'rust_analyzer', 'vimls', 'pyright', 'svelte', 'tailwindcss'
}

-- para colocal border a la ventana de diagnosticos
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
   vim.lsp.handlers.hover,
   {
      border = "rounded"
   }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
   vim.lsp.handlers.signature_help,
   {
      border = "rounded"
   }
)

vim.diagnostic.config({
   virtual_text = true, -- es el texto del diagnostico
   signs = true,
   float = {
      border = 'rounded',
      format = function (diagnostic)
         return string.format(
            '%s',
            diagnostic.message
         )
      end
   }
})

-- Agregar capacidades adicionales admitidas por nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use una función on_attach para mapear solo las siguientes teclas
-- después de que el servidor de idioma se conecte al búfer actual
local on_attach = function(_, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   -- Enable completion triggered by <c-x><c-o>
   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   local opts = { noremap=true, silent=true }

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
   -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
   -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
   -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
   -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
   -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

   -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   buf_set_keymap('n', 'N', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   buf_set_keymap('n', '<space>re', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   buf_set_keymap('n', 'rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- requerido para Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

for _, lsp in pairs(servers) do
   nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      -- indicador de rebore, estara integrado pare nvim 0.7+
      flags = { debounce_text_changes = 150, },

      settings = {
         ["rust-analyzer"] = {
            assist = {
               importGranularity = "module",
               importPrefix = "by_self",
            },
            cargo = {
               loadOutDirsFromCheck = true
            },
            procMacro = {
               enable = true
            },
         },

         Lua = {
            runtime = {
               -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
               version = 'LuaJIT',
               -- Setup your lua path
               path = runtime_path,
            },
            diagnostics = {
               -- Get the language server to recognize the `vim` global
               globals = {'vim'},
            },
            workspace = {
               -- Make the server aware of Neovim runtime files
               library = vim.api.nvim_get_runtime_file("", true),
               -- Para anular la ventana de optiones al terminar de ejecutar love2d
               checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
               enable = false,
            },
         },
      }
   }
end

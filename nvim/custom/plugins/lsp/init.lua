-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, 'typescript')
local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not mason_ok or not mason_lsp_ok then
   return
end

mason.setup({ ui = { border = 'rounded' } })

mason_lsp.setup({
   ensure_installed = {
      'html-lsp', 'css-lsp', 'emmet-ls', 'typescript-language-server', 'eslint-lsp',
      'stylelint-lsp', 'json-lsp', 'lua-language-server', 'tailwindcss-language-server',
      'pyright', 'svelte-language-server', 'rust-analyzer',
      'chrome-debug-adapter', 'node-debug2-adapter'
   },
   automatic_installation = true,
})


-- Atajo para los diagnosticos
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", opts)
map('n', ']d', "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
map('n', '[d', "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
-- map('n', '<space>q', vim.diagnostic.setloclist, opts)

local function on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
end

local capabilities = require("plugins.configs.lspconfig").capabilities

local handlers = {
   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
   ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }),
}


local lspconfig = require('lspconfig')
-- Config lsp servers
if typescript_ok then
   typescript.setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      server = {
         capabilities = require('custom.plugins.lsp.servers.tsserver').capabilities,
         handlers = handlers,
         on_attach = require('custom.plugins.lsp.servers.tsserver').on_attach,
      }
   })
end

lspconfig.tailwindcss.setup {
   -- root_dir = lspconfig.util.root_pattern('tailwind.config.js'),
   capabilities = require('custom.plugins.lsp.servers.tailwindcss').capabilities,
   filetypes = require('custom.plugins.lsp.servers.tailwindcss').filetypes,
   handlers = handlers,
   init_options = require('custom.plugins.lsp.servers.tailwindcss').init_options,
   on_attach = require('custom.plugins.lsp.servers.tailwindcss').on_attach,
   settings = require('custom.plugins.lsp.servers.tailwindcss').settings,
}

lspconfig.eslint.setup {
   root_dir = lspconfig.util.root_pattern('.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml'),
   capabilities = capabilities,
   handlers = handlers,
   on_attach = require('custom.plugins.lsp.servers.eslint').on_attach,
   settings = require('custom.plugins.lsp.servers.eslint').settings,
}

lspconfig.sumneko_lua.setup {
   handlers = handlers,
   on_attach = on_attach,
   settings = require('custom.plugins.lsp.servers.sumneko_lua').settings,
}

lspconfig.rust_analyzer.setup {
   handlers = handlers,
   on_attach = on_attach,
   capabilities = capabilities,
   settings = require('custom.plugins.lsp.servers.rust_analyzer').settings,
}

lspconfig.pyright.setup {
   handlers = handlers,
   on_attach = on_attach,
   settings = require('custom.plugins.lsp.servers.pyright').settings,
}

lspconfig.stylelint_lsp.setup {
   root_dir = lspconfig.util.root_pattern('.stylelintrc'),
   filetypes = { 'css', 'less', 'scss', 'sugarss', 'vue', 'wxss' },
   on_attach = on_attach,
   capabilities = capabilities,
   handlers = handlers,
}

lspconfig.emmet_ls.setup {
   filetypes = { 'html', 'css', 'sass', 'scss', 'less' },
   capabilities = capabilities,
   handlers = handlers,
}

local servers = { 'html', 'cssls', 'svelte', 'jsonls' }

for _, lsp in ipairs(servers) do
   lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
   }
end

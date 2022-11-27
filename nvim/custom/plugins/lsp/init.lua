require("custom.plugins.lsp.util").mason()
require("custom.plugins.lsp.util").icons_lsp()

-- theme
require("base46").load_highlight("lsp")

-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, "typescript")
local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local on_attach = require("custom.plugins.lsp.util").on_attach
local capabilities = require("custom.plugins.lsp.util").capabilities
local handlers = require("custom.plugins.lsp.util").handlers

-- Atajo para los diagnosticos
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
-- map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Config lsp servers
if typescript_ok then
   typescript.setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      server = {
         capabilities = require("custom.plugins.lsp.servers.tsserver").capabilities,
         handlers = handlers,
         on_attach = require("custom.plugins.lsp.servers.tsserver").on_attach,
      },
   })
end

lspconfig.tailwindcss.setup({
   root_dir = lspconfig.util.root_pattern("tailwind.config.js"),
   capabilities = require("custom.plugins.lsp.servers.tailwindcss").capabilities,
   filetypes = require("custom.plugins.lsp.servers.tailwindcss").filetypes,
   handlers = handlers,
   init_options = require("custom.plugins.lsp.servers.tailwindcss").init_options,
   on_attach = require("custom.plugins.lsp.servers.tailwindcss").on_attach,
   settings = require("custom.plugins.lsp.servers.tailwindcss").settings,
})

lspconfig.eslint.setup({
   root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml"),
   capabilities = capabilities,
   handlers = handlers,
   on_attach = require("custom.plugins.lsp.servers.eslint").on_attach,
   settings = require("custom.plugins.lsp.servers.eslint").settings,
})

lspconfig.sumneko_lua.setup({
   root_dir = lspconfig.util.root_pattern(
      ".luarc.json",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      ".git"
   ),
   handlers = handlers,
   on_attach = on_attach,
   settings = require("custom.plugins.lsp.servers.sumneko_lua").settings,
})

for _, lsp in ipairs({  "emmet_ls" }) do
   lspconfig[lsp].setup({
      capabilities = capabilities,
      handlers = handlers,
   })
end

local servers = {
   "html",
   "cssls",
   "svelte",
   "jsonls",
   "marksman",
   "clangd",
   "pyright",
   "yamlls",
   "rust_analyzer",
   "stylelint_lsp",
}

for _, lsp in ipairs(servers) do
   lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
         python = require("custom.plugins.lsp.servers.pyright").settings.python,
         yaml = require("custom.plugins.lsp.servers.yaml").settings.yaml,
         Rust = require("custom.plugins.lsp.servers.rust_analyzer").settings.Rust,
         stylelintplus = require("custom.plugins.lsp.servers.stylelint").settings.stylelintplus,
      },
   })
end

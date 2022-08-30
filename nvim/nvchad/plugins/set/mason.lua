local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not mason_lsp_ok then
   return
end

mason_lsp.setup({
   ensure_installed = {
      'html-lsp', 'css-lsp', 'emmet-ls', 'typescript-language-server', 'eslint-lsp',
      'stylelint-lsp', 'json-lsp', 'lua-language-server', 'tailwindcss-language-server',
      'pyright', 'svelte-language-server', 'rust-analyzer',
      'chrome-debug-adapter', 'node-debug2-adapter'
   },
   automatic_installation = true,
})

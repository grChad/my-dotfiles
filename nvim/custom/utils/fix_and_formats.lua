-- para ejecutar por consola
local lang_maps = {
   javascript = { build = "node %" },
   typescript = { build = "tsc" },
   lua = { build = "lua %" },
   -- rust = { build = "cargo run" },
   rust = { build = "rustc %" },
   python = { build = "python3 %" },
}

for lang, data in pairs(lang_maps) do
   vim.api.nvim_create_autocmd(
      "FileType",
      { command = "nnoremap <Leader>co :!" .. data.build .. "<CR>", pattern = lang }
   )
end
-- +--------------------------------------------------------------------+
-- Para formatear el documento
local lang_format = {
   javascript = { format = "npx eslint --fix %" },
   javascriptreact = { format = "npx eslint --fix %" },
   typescript = { format = "npx eslint --fix %" },
   typescriptreact = { format = "npx eslint --fix %" },
   css = { format = "npx stylelint --fix %" },
   scss = { format = "npx stylelint --fix %" },
}

for lang, data in pairs(lang_format) do
   vim.api.nvim_create_autocmd(
      "FileType",
      { command = "nnoremap <Leader>fi :silent !" .. data.format .. "<CR>", pattern = lang }
   )
end

-- para ejecutar love2D
vim.api.nvim_create_autocmd("FileType", { command = "nnoremap <Leader>lo :!love .", pattern = "lua" })

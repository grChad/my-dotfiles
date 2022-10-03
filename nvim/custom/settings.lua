-- settings globals
vim.g.luasnippets_path = "./lua/custom/snippets/" -- ruta de los snippets personales

-- settings locals
local options = {
   wrap = false,
   linebreak = true,
   breakindent = true,
   hidden = true,
   writebackup = false,
   pumheight = 10,
   spelllang = { "en", "es", "cjk" }, -- Establecer idiomas en ese orden
   spellsuggest = "best,9", -- Muestra las 9 mejores opciones de correccion.
   spelloptions = "camel", -- Para que no muestre error ortografico en los CamelCase
   inccommand = "split",
}

for key, value in pairs(options) do
   vim.opt[key] = value
end

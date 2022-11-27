local M = {}

M.ui = {
	theme = "doomchad",
	hl_override = require("custom.theme.hl_override"),
	hl_add = require("custom.theme.hl_add"),
}

-- configuración de plugins: remove, overrides and new plugins
M.plugins = require("custom.plugins")

-- configuración de atajos de teclado
M.mappings = require("custom.mappings")

return M

local icons = require("custom.utils.iconos")
local colors = require("custom.utils.colors")

local User = {
	NvimTree = {
		windows_float = true,
		width = 40,
		height = 25,
		position = "left", -- if windows_float = false: => 'left' and 'right'
	},
	icons = icons,
	colors = colors,
}

return User

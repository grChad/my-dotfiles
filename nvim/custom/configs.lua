local icons = require("custom.iconos")
local colors = require("custom.theme.colors")

return {
   NvimTree = {
      windows_float = true,
      width = 40,
      height = 25,
      position = "left", -- if windows_float =  false: => 'left' and 'right'
   },
   icons = icons,
   colors = colors,
}

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "palenight"
}

M.plugins = {
   user = require('custom.plugins'),
   remove = {},
   override = {
      ["NvChad/ui"] = {
         tabufline = {
            enabled = false,
            lazyload = true,
            overriden_modules = nil,
         },
      }
   },
}
M.mappings = require('custom.mappings')

return M

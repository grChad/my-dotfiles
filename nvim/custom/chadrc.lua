-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "doomchad",
   hl_override = require("custom.theme.hl_override"),
   hl_add = require("custom.theme.hl_add"),
}

local pluginConfs = require("custom.plugins.override")

M.plugins = {
   remove = { "nvim-treesitter/nvim-treesitter" },
   user = require("custom.plugins"),
   override = {
      ["hrsh7th/nvim-cmp"] = pluginConfs.cmp_change,
      ["lewis6991/gitsigns.nvim"] = pluginConfs.git_signs,
   },
}

M.mappings = require("custom.mappings")

return M

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "catppuccin",
   -- transparency = true,
}

local pluginConfs = require 'custom.plugins.override'

M.plugins = {
   user = require('custom.plugins'),
   remove = {},
   override = {
      ['NvChad/ui'] = pluginConfs.uiChad,
      ['nvim-treesitter/nvim-treesitter'] = pluginConfs.treesitter,
      ['hrsh7th/nvim-cmp'] = pluginConfs.cmp_change,
      ['lewis6991/gitsigns.nvim'] = pluginConfs.git_signs,
   },
}

M.mappings = require('custom.mappings')

return M

local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

require("base46").load_highlight "treesitter"

local options = {
   ensure_installed = {
      'lua', 'javascript', 'typescript', 'markdown', 'markdown_inline'
   },
   highlight = {
      enable = true,
      use_languagetree = true,
      disable = { 'html', 'css', 'scss' }
   },

   indent = {
      enable = true
   },

   autotag = {
      enable = true,
   },

   rainbow = {
      enable = true,
      extended_mode = true,
   },

   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
}

-- check for any override
options = require("core.utils").load_override(options, "nvim-treesitter/nvim-treesitter")

treesitter.setup(options)

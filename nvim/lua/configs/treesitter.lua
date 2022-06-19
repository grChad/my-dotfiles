local treesitter = require('nvim-treesitter.configs')
if not treesitter then
   return
end

treesitter.setup {
   sync_install = false,
   ignore_install = { 'vim', 'scss' },
   highlight = {
      enable = true,
      disable = { 'vim', 'scss' },
      additional_vim_regex_highlighting = true,
   },
   indent = {
      enable = true,
   },
}

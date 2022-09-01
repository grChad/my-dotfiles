local M = {}

M.treesitter = {
   ensure_installed = 'all',
   -- ignore_install = { 'html', 'css', 'scss' },
   highlight = {
      enable = true,
      disable = { 'html', 'css', 'scss' },
      additional_vim_regex_highlighting = true,
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

M.uiChad = {
   tabufline = {
      enabled = false,
      lazyload = true,
      overriden_modules = nil,
   },
}

return M

P = function(v)
   print(vim.pretty_print(v))
   return v
end

RELOAD = function(...)
   return require("plenary.reload").reload_module(...)
end

R = function(name)
   RELOAD(name)
   return require(name)
end

-- No comentar las linear anterior o porterior
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

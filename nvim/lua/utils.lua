-- Para que los comentarios no se repitan
vim.cmd([[ autocmd! BufEnter * set fo-=r fo-=o ]])
-- +--------------------------------------------------------------------+

-- Colour overrides
vim.cmd([[
	highlight! link CursorLineNr MatchParen
	highlight! link WinSeparator LineNr
]])

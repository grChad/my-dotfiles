vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.hidden = true
vim.opt.writebackup = false
vim.opt.pumheight = 10
vim.opt.colorcolumn:append('80')

local map = vim.keymap.set
local silent = { silent = true }
-- keymap('n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
map('n', 'rf', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>', silent)
map('n', '<C-Space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', silent)
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', silent)
map('v', '<Leader>ca', "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
map('n', '<Leader>re', "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
-- map('n', '<Leader>cf', "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
map('n', '<C-p>', "<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>", silent)
map('v', '<C-p>', "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
map('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
map('n', 'L', "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)


map('n', '<leader>p', ':silent !npx prettier --write %<CR>')

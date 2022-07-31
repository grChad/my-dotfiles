-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ╏              init.lua by Gabriel Rivera -> GabrielRIP              ╏
-- ╏                 > Credito: ecosse3/nvim                            ╏
-- ╏                 > Nvim la mas actual Stable o Dev                  ╏
-- ╏            > Language Servers: comprobar lsp y linters             ╏
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- +--------------------------------------------------------------------+
-- PERFORMANCE: Acelera la carga de modulos Lua en Nvim
local impatient_ok, impatient = pcall(require, 'impatient')
if impatient_ok then impatient.enable_profile() end
-- +--------------------------------------------------------------------+

-- PERFORMANCE: Para que no sea compatible con 'vi', pero no de golpe
if vim.opt.compatible == true then vim.opt.compatible = false end
-- +--------------------------------------------------------------------+

require('packer_commands')
require('buffertag').setup()
require('globals')
require('config')
require('settings')
require('colorscheme')
require('keymappings')
require('autocmds')
require('functions')

require('lsp.setup')
require('lsp.functions')

require('snippets.react')

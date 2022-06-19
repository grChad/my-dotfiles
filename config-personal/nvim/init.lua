-- adminsistrador de packetes packer
require 'packages'

-- configs 'sets'
require 'settings'

-- keyboard shortcuts
require 'maps'

-- functions and others
require 'utils'

-- settings and shortcuts
vim.cmd('source $HOME/.config/nvim/lua/settings.vim')
vim.cmd('source $HOME/.config/nvim/lua/keys.vim')

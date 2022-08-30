return {
   ['romgrk/barbar.nvim'] = {
      config = function()
         require('custom.plugins.set.barbar')
      end
   },
   ['kyazdani42/nvim-tree.lua'] = {
      config = function() require('custom.plugins.set.tree') end,
   },
   ['kyazdani42/nvim-web-devicons'] = {
      config = function() require('custom.plugins.set.devicons') end
   },
   ['nvim-treesitter/nvim-treesitter'] = {
      module = "nvim-treesitter",
      setup = function()
         require("core.lazy_load").on_file_open "nvim-treesitter"
      end,
      cmd = require("core.lazy_load").treesitter_cmds,
      run = ":TSUpdate",
      config = function()
         require('custom.plugins.set.tressiter')
      end
   },
   ['goolord/alpha-nvim'] = { disable = false },
   ['m-demare/hlargs.nvim'] = {
      config = function() require('hlargs').setup() end,
      -- after = { 'nvim-treesitter' }
   },
   ['windwp/nvim-ts-autotag'] = {
      config = function() require('nvim-ts-autotag').setup() end,
   },
   ['stevearc/dressing.nvim'] = {
      config = function() require('custom.plugins.set.dressing') end
   },
   ['ggandor/lightspeed.nvim'] = { event = 'BufRead' },
   ['iamcco/markdown-preview.nvim'] = {
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
         vim.g.mkdp_auto_start = 1
         vim.g.mkdp_auto_close = 0
         vim.keymap.set('n', '<leader>m', ':MarkdownPreview<CR>')
      end,
   },
   ['KabbAmine/vCoolor.vim'] = {},
   ['mrshmllow/document-color.nvim'] = {}, -- for tailwind
   -- LSP: config
   ['jose-elias-alvarez/typescript.nvim'] = {}, -- for lsp and tsserver
   ['neovim/nvim-lspconfig'] = {
      config = function()
         require 'custom.plugins.lsp'
      end,
   },
   ['williamboman/mason.nvim'] = {},
   ['williamboman/mason-lspconfig.nvim'] = {},
   ['L3MON4D3/LuaSnip'] = {
      config = function()
         require('luasnip').config.set_config({
            history = true,
            updateevents = 'TextChanged,TextChangedI',
         })
         require('luasnip.loaders.from_vscode').lazy_load()
         require('luasnip.loaders.from_vscode').lazy_load({ paths = { './lua/custom/snippets/' } })
      end
   },
}

return {
   ['NvChad/ui'] = {
      config = function() return end
   },
   ['romgrk/barbar.nvim'] = {
      config = function() require('custom.plugins.set.barbar') end
   },
   ['glepnir/galaxyline.nvim'] = {
      after = 'base46',
      config = function() require('custom.plugins.set.galaxyline') end
   },
   ['kyazdani42/nvim-tree.lua'] = {
      config = function() require('custom.plugins.set.tree') end,
   },
   ['kyazdani42/nvim-web-devicons'] = {
      config = function() require('custom.plugins.set.devicons') end
   },
   ['goolord/alpha-nvim'] = { disable = false },
   ['lukas-reineke/indent-blankline.nvim'] = {
      config = function() require('custom.plugins.set.indent') end
   },
   ['m-demare/hlargs.nvim'] = {
      config = function() require('hlargs').setup() end,
   },
   ['windwp/nvim-ts-autotag'] = {
      config = function() require('nvim-ts-autotag').setup() end,
   },
   ['stevearc/dressing.nvim'] = {
      config = function() require('custom.plugins.set.dressing') end
   },
   ['ggandor/lightspeed.nvim'] = { event = 'BufRead' },
   ['NvChad/nvim-colorizer.lua'] = {
      config = function() require('custom.plugins.set.colorizer') end
   },
   ['KabbAmine/vCoolor.vim'] = {},
   ['mrshmllow/document-color.nvim'] = {}, -- for tailwind
   -- LSP: config
   ['jose-elias-alvarez/typescript.nvim'] = {}, -- for lsp and tsserver
   ['neovim/nvim-lspconfig'] = {
      opt = true,
      setup = function()
         require("core.lazy_load").on_file_open('nvim-lspconfig')
      end,
      config = function() require('custom.plugins.lsp') end,
   },
   ['williamboman/mason.nvim'] = {},
   ['williamboman/mason-lspconfig.nvim'] = {},
   -- para markdown
   ['iamcco/markdown-preview.nvim'] = {
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
         vim.g.mkdp_auto_start = 1
         vim.g.mkdp_auto_close = 0
         vim.keymap.set('n', '<leader>m', ':MarkdownPreview<CR>')
      end,
   },
   ['gaoDean/autolist.nvim'] = {
      config = function() require('autolist').setup({}) end
   }
}

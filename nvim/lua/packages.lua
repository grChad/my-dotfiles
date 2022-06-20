-- load packer
local packer = require('configs.packer')
if not packer then
   return
end

packer.startup(function(use)

   -- Packer plugin manager --------------------------------------------------
   use { "wbthomason/packer.nvim" }

   -- Theme for Nvim ---------------------------------------------------------
   use {
      'ful1e5/onedark.nvim',
      config = function() require ('configs.onedark') end
   }

   -- Dependencies -----------------------------------------------------------
   use {
      'kyazdani42/nvim-web-devicons',
      config = function () require ('configs.web-devicons') end
   }
   use {
      'lewis6991/impatient.nvim',
      config = function () require('impatient').enable_profile() end
   }

   -- syntax Highlighting ----------------------------------------------------
   use {
      'nvim-treesitter/nvim-treesitter',
      config = function() require ('configs.treesitter') end
   }

   -- Buffer y barra de estado -----------------------------------------------
   use { -- Buffer
      'romgrk/barbar.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('configs.barbar') end
   }
   use { -- State Bar
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require ('configs.lualine') end
   }

   -- Tree file manager ------------------------------------------------------
   use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require ('configs.nvim-tree') end,
   }

   -- IDE and complementos ---------------------------------------------------
   use {
      'windwp/nvim-autopairs',
      after = { 'nvim-treesitter', 'nvim-cmp' },
      config = function() require('plugins.autopairs') end
   }
   use { 'easymotion/vim-easymotion' }
   use { 'editorconfig/editorconfig-vim' }   -- normalize files
   use { 'KabbAmine/vCoolor.vim' }           -- palet of colors
   use { -- Para moverse por las linear buscando en el cmd por :Number
      'nacro90/numb.nvim',
      config = function() require('numb').setup() end
   }
   use { -- indentado en lineas
      'lukas-reineke/indent-blankline.nvim',
      config = function() require ('configs.blankline') end
   }

   use { -- commentary
      'numToStr/Comment.nvim',
      config = function () require('Comment').setup() end,
   }
   use { 'LudoPinelli/comment-box.nvim' }
   use { -- comentarios con mas detalles
      'folke/todo-comments.nvim',
      config = function() require('configs.todo-comments') end
   }

   use { -- sigs for git
      'lewis6991/gitsigns.nvim',
      config = function () require ('configs.gitsigns') end
   }
   use { -- pigment of colors
      'norcalli/nvim-colorizer.lua',
      config = function () require ('configs.colorizer') end
   }

   -- lsp and cmp ------------------------------------------------------------
   use {
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      requires = {
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'saadparwaiz1/cmp_luasnip',
      },
      config = function() require ('lsp.cmp') end
   }

   use { -- Collection of configurations for built-in LSP client
      'neovim/nvim-lspconfig',
      config = function() require ('lsp.lspconfig') end
   }

   -- LSP Addons
   use {
      'stevearc/dressing.nvim',
      requires = { 'MunifTanjim/nui.nvim' },
      config = function() require ('configs.dressing') end
   }

   -- Snippets ---------------------------------------------------------------
   use { 'rafamadriz/friendly-snippets' }
   use {
      "L3MON4D3/LuaSnip",
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load()
      end
   }

   -- Para umular ficheros markdown ------------------------------------------
   use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install'
   }

end)

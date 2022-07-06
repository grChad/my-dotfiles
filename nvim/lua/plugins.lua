local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. '/plugin/packer_compiled.lua'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system(
      { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
   )
end

return require('packer').startup({
   function(use)
      -- (1) Packer plugin manager
      use { "wbthomason/packer.nvim" }
-- +--------------------------------------------------------------------+
      -- (2) Necesarios para cargar primero
      use { 'lewis6991/impatient.nvim' }
      use { 'nathom/filetype.nvim'}
      use { 'nvim-lua/plenary.nvim' }
      use { -- iconos de archivos
         'kyazdani42/nvim-web-devicons',
         config = function () require ('configs.web-devicons') end
      }
      use { -- Para la portada inicial
         'goolord/alpha-nvim',
         config = function() require('configs.alpha') end
      }
-- +--------------------------------------------------------------------+
      -- (3) Themes
      use { 'ful1e5/onedark.nvim' }
-- +--------------------------------------------------------------------+
      -- (4) Treesitter
      use {
         'nvim-treesitter/nvim-treesitter',
         config = function() require ('configs.treesitter') end
      }
      use {
         'nvim-treesitter/nvim-treesitter-textobjects',
         after = 'nvim-treesitter'
      }
      use {
         'RRethy/nvim-treesitter-textsubjects',
         after = 'nvim-treesitter'
      }
      use {
         'm-demare/hlargs.nvim',
         config = function() require('hlargs').setup() end
      }
-- +--------------------------------------------------------------------+
      -- (5) Navegacion (Telescope/ Tree/ Refactor)
      use {
         'kyazdani42/nvim-tree.lua',
         requires = { 'kyazdani42/nvim-web-devicons' },
         config = function() require ('configs.tree') end,
      }
-- +--------------------------------------------------------------------+
      -- (6) LSP Base
      use {
         'neovim/nvim-lspconfig',
         config = function() require ('lsp.lspconfig') end
      }
-- +--------------------------------------------------------------------+
      -- (7) CMP
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
-- +--------------------------------------------------------------------+
      -- (8) LSP Complementos
      use {
         'stevearc/dressing.nvim',
         requires = { 'MunifTanjim/nui.nvim' },
         config = function() require ('configs.dressing') end
      }
-- +--------------------------------------------------------------------+
      -- (9) Buffer and Bar state
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
-- +--------------------------------------------------------------------+
      -- (10) General
      use { 'AndrewRadev/switch.vim' }
      use { -- commentary
         'numToStr/Comment.nvim',
         config = function () require('Comment').setup() end,
      }
      use {
         'LudoPinelli/comment-box.nvim',
         config = function() require('configs.comment_box') end
      }
      use { -- comentarios con mas detalles
         'folke/todo-comments.nvim',
         config = function() require('configs.todo-comments') end
      }
      use { 'easymotion/vim-easymotion' }
      use { 'airblade/vim-rooter' }
-- +--------------------------------------------------------------------+
      -- (11) Snippets & Language & syntax
      use {
         'windwp/nvim-autopairs',
         after = { 'nvim-treesitter', 'nvim-cmp' },
         config = function() require('configs.autopairs') end
      }
      use {
         'windwp/nvim-ts-autotag',
         config = function() require('nvim-ts-autotag').setup() end
      }
      use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
      use { -- indentado en lineas
         'lukas-reineke/indent-blankline.nvim',
         config = function() require ('configs.blankline') end
      }
      use { -- pigment of colors
         'norcalli/nvim-colorizer.lua',
         config = function () require ('configs.colorizer') end
      }
      use { 'KabbAmine/vCoolor.vim' }           -- palet of colors
      use { 'editorconfig/editorconfig-vim' }   -- normalize files
      use { -- Para moverse por las linear buscando en el cmd por :Number
         'nacro90/numb.nvim',
         config = function() require('numb').setup() end
      }
      use { 'rafamadriz/friendly-snippets' }
      use {
         "L3MON4D3/LuaSnip",
         config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
         end
      }
-- +--------------------------------------------------------------------+
      -- (12) Git
      use { -- sigs for git
         'lewis6991/gitsigns.nvim',
         requires = { 'nvim-lua/plenary.nvim' },
         config = function () require ('configs.gitsigns') end,
         event = 'BufRead'
      }
      use {
         'akinsho/git-conflict.nvim',
         config = function() require('git-conflict').setup() end
      }
-- +--------------------------------------------------------------------+
      -- (13) Preview MarkDown
      use {
         'iamcco/markdown-preview.nvim',
         run = 'cd app && npm install'
      }
-- +--------------------------------------------------------------------+
      if packer_bootstrap then
         require('packer').sync()
      end
   end,
   config = {
      compile_path = compile_path,
      disable_commands = true,
      max_jobs = 50,
      display = {
         open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
         end
      }
   }
})

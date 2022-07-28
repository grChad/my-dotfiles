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
      use 'wbthomason/packer.nvim'
      -- +--------------------------------------------------------------------+
      -- (2) Necesarios para cargar primero
      use { 'lewis6991/impatient.nvim' }
      use { 'nathom/filetype.nvim' }
      use { 'nvim-lua/plenary.nvim' }
      use {
         'kyazdani42/nvim-web-devicons',
         config = function() require('plugins.devicons') end
      }
      use { -- Para la portada Inicial con las Opciones
         'goolord/alpha-nvim',
         config = function() require('plugins.alpha') end
      }
      -- +--------------------------------------------------------------------+
      -- (3) Themes
      use { "catppuccin/nvim", as = "catppuccin" }
      -- +--------------------------------------------------------------------+
      -- (4) Treesitter
      use {
         'nvim-treesitter/nvim-treesitter',
         config = function() require('plugins.treesitter') end
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
      -- (5) Navigating (Telescope/Tree/Refactor)
      use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      use {
         'nvim-telescope/telescope.nvim',
         requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim' }
         },
         config = function() require('plugins.telescope') end
      }
      use { 'cljoly/telescope-repo.nvim' }
      use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
      use {
         'kyazdani42/nvim-tree.lua',
         config = function() require('plugins.tree') end
      }
      -- +--------------------------------------------------------------------+
      -- (6) LSP Base
      use { 'williamboman/nvim-lsp-installer' }
      use { 'neovim/nvim-lspconfig' }
      -- +--------------------------------------------------------------------+
      -- (7) LSP Cmp
      use {
         'hrsh7th/nvim-cmp',
         event = 'InsertEnter',
         config = function() require('plugins.cmp_config') end
      }
      use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
      use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
      use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
      use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
      use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
      use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
      use {
         'tzachar/cmp-tabnine',
         run = './install.sh',
         requires = { 'hrsh7th/nvim-cmp' },
         after = 'cmp-calc'
      }
      use {
         'David-Kunz/cmp-npm',
         after = 'cmp-tabnine',
         requires = { 'nvim-lua/plenary.nvim' },
         config = function() require('plugins.cmp-npm') end
      }
      use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-npm' }
      -- +--------------------------------------------------------------------+
      -- (8) LSP Addons
      use {
         'stevearc/dressing.nvim',
         requires = { 'MunifTanjim/nui.nvim' },
         config = function() require('plugins.dressing') end
      }
      use { 'onsails/lspkind-nvim' }
      use { 'nvim-lua/popup.nvim' }
      use {
         'ChristianChiarulli/nvim-gps',
         branch = 'text_hl',
         config = function() require('plugins.gps') end,
         after = 'nvim-treesitter'
      }
      use { 'jose-elias-alvarez/typescript.nvim' }
      -- +--------------------------------------------------------------------+
      -- (9) Buffer and Bar state
      use { -- Buffer
         'romgrk/barbar.nvim',
         requires = { 'kyazdani42/nvim-web-devicons' },
         config = function() require('plugins.barbar') end
      }
      use { -- Bar State
         'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true },
         config = function() require('plugins.lualine') end
      }
      use {
         'ldelossa/buffertag',
         config = function() require('buffertag').enable() end
      }
      -- +--------------------------------------------------------------------+
      -- (10) General
      use { 'AndrewRadev/switch.vim' }
      use { 'AndrewRadev/splitjoin.vim' }
      use { -- commentary in Line
         'numToStr/Comment.nvim',
         config = function() require('Comment').setup() end
      }
      use {
         'LudoPinelli/comment-box.nvim',
         config = function() require('plugins.comment_box') end
      }
      use {
         'folke/todo-comments.nvim',
         config = function() require('plugins.todo_comments') end
      }
      use {
         'JoosepAlviste/nvim-ts-context-commentstring',
         after = 'nvim-treesitter'
      }
      use {
         'akinsho/nvim-toggleterm.lua',
         branch = 'main',
         config = function() require('plugins.toggleterm') end
      }
      use { 'tpope/vim-repeat' }
      use { 'tpope/vim-speeddating' }
      use { 'dhruvasagar/vim-table-mode' }
      use { 'mg979/vim-visual-multi' }
      use { 'junegunn/vim-easy-align' }
      use {
         'folke/zen-mode.nvim',
         config = function() require('plugins.zen') end,
         disable = not EcoVim.plugins.zen.enabled
      }
      use { 'folke/twilight.nvim', config = function() require("twilight").setup {} end,
         disable = not EcoVim.plugins.zen.enabled }
      use { 'ggandor/lightspeed.nvim' }
      use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
      use {
         'vuki656/package-info.nvim',
         event = 'BufEnter package.json',
         config = function() require('plugins.package-info') end
      }
      use {
         'iamcco/markdown-preview.nvim',
         run = 'cd app && npm install',
         setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
         ft = { 'markdown' }
      }
      use {
         'declancm/cinnamon.nvim',
         config = function() require('plugins.cinnamon') end
      }
      use {
         'airblade/vim-rooter',
         setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end
      }
      use {
         'Shatur/neovim-session-manager',
         config =function() require('plugins.session-manager') end
      }
      use { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end }
      -- +--------------------------------------------------------------------+
      -- (11) Snippets & Language & Syntax
      use {
         'windwp/nvim-autopairs',
         after = { 'nvim-treesitter', 'nvim-cmp' },
         config = function() require('plugins.autopairs') end
      }
      use {
         'windwp/nvim-ts-autotag',
         config = function() require('nvim-ts-autotag').setup() end
      }
      use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
      use {
         'lukas-reineke/indent-blankline.nvim',
         config = function() require('plugins.indent') end
      }
      use {
         'NvChad/nvim-colorizer.lua',
         config = function() require('plugins.colorizer_config') end
      }
      use { 'KabbAmine/vCoolor.vim' }
      use { 'potamides/pantran.nvim' }
      use {
         'L3MON4D3/LuaSnip',
         requires = { 'rafamadriz/friendly-snippets' },
         after = 'cmp_luasnip'
      }
      -- +--------------------------------------------------------------------+
      -- (12) Git
      use { 'lewis6991/gitsigns.nvim',
         requires = { 'nvim-lua/plenary.nvim' },
         config = function() require('plugins.git.signs') end,
         event = 'BufRead'
      }
      use {
         'sindrets/diffview.nvim',
         config = function() require('plugins.git.diffview') end
      }
      use {
         'akinsho/git-conflict.nvim',
         config = function() require('plugins.git.conflict') end
      }
      use {
         'ThePrimeagen/git-worktree.nvim',
         config = function() require('plugins.git.worktree') end
      }
      use { 'kdheepak/lazygit.nvim' }
      -- +--------------------------------------------------------------------+
      -- (13) Testing
      use {
         'rcarriga/neotest',
         requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
            'haydenmeade/neotest-jest'
         },
         config = function() require('plugins.neotest') end
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

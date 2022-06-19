-- load packer
local packer = require('configs.packer')
if not packer then
    return
end

packer.startup(function(use)

    -- Packer plugin manager --------------------------------------------------
    use { "wbthomason/packer.nvim" }

    -- Theme for Nvim ---------------------------------------------------------
    -- use { 'folke/tokyonight.nvim' }
    use {
	    'ful1e5/onedark.nvim',
	    config = function()
		require 'configs.onedark'
	    end
	}

    -- syntax Highlighting ----------------------------------------------------
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require "configs.treesitter"
        end,
        run = ":TSUpdate",
    }

    -- Dependency for icons ---------------------------------------------------
    use {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require 'configs.web-devicons'
        end
    }

    -- Buffer y barra de estado -----------------------------------------------
    use { -- Buffer
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'configs.bufferline'
        end
    }

    use { -- State Bar
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require 'configs.lualine'
        end
    }

    -- Tree file manager ------------------------------------------------------
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require "configs.nvim-tree"
        end,
    }

    -- IDE and complementos ---------------------------------------------------
    use { 'jiangmiao/auto-pairs' } -- {},[],'',""..
    use { 'christoomey/vim-tmux-navigator' }
    use { 'easymotion/vim-easymotion' }
    use { 'editorconfig/editorconfig-vim' }   -- normalize files
    use { 'KabbAmine/vCoolor.vim' }           -- palet of colors

    use { -- indentado en lineas
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require 'configs.blankline'
        end
    }


    use { -- commentary
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup{}
        end,
    }

    use { -- sigs for git
        'lewis6991/gitsigns.nvim',
        config = function ()
            require 'configs.gitsigns'
        end
    }

    use { -- pigment of colors
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require 'configs.colorizer'
        end
    }

    -- lsp and cmp ------------------------------------------------------------
    use {
        "hrsh7th/nvim-cmp", -- Autocompletion plugin
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require 'lsp.cmp'
        end
    }

    use { -- Collection of configurations for built-in LSP client
        'neovim/nvim-lspconfig',
        config = function()
            require 'lsp.lspconfig'
        end
    }

    -- Snippets ---------------------------------------------------------------
    use { 'rafamadriz/friendly-snippets' }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }

    -- Pre-visualizador de Markdown. ------------------------------------------
    use { 'iamcco/markdown-preview.nvim' }

end)

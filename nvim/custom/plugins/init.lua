return {
   ["NvChad/ui"] = { -- para no usarlo por completo
      config = function()
         return
      end,
   },
   ["hrsh7th/nvim-cmp"] = { -- override
      override_options = require("custom.plugins.override").cmp_change,
   },
   ["lewis6991/gitsigns.nvim"] = { -- override
      override_options = require("custom.plugins.override").git_signs,
   },
   ["nvim-treesitter/nvim-treesitter"] = { -- reemplazar configuracion
      config = function()
         require("custom.plugins.configs.treesitter")
      end,
   },
   ["romgrk/barbar.nvim"] = {
      config = function()
         require("custom.plugins.configs.barbar")
      end,
   },
   ["GabrielRIP/bufferSplitSimple"] = {
      config = function()
         require("buffer-split-simple").setup()
      end,
   },
   ["glepnir/galaxyline.nvim"] = {
      after = "base46",
      config = function()
         require("custom.plugins.configs.galaxyline")
      end,
   },
   ["kyazdani42/nvim-tree.lua"] = {
      config = function()
         require("custom.plugins.configs.tree")
      end,
   },
   ["kyazdani42/nvim-web-devicons"] = {
      config = function()
         require("custom.plugins.configs.devicons")
      end,
   },
   ["goolord/alpha-nvim"] = {
      disable = false,
   },
   ["lukas-reineke/indent-blankline.nvim"] = {
      config = function()
         require("custom.plugins.configs.indent")
      end,
   },
   ["m-demare/hlargs.nvim"] = {
      config = function()
         require("hlargs").setup({
            color = "#EF9F76",
            highlight = { fg = "#EF9F76", italic = true, bold = true },
         })
      end,
   },
   ["windwp/nvim-ts-autotag"] = {
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },
   ["ggandor/lightspeed.nvim"] = { event = "BufRead" },
   ["NvChad/nvim-colorizer.lua"] = {
      config = function()
         require("custom.plugins.configs.colorizer")
      end,
   },
   ["KabbAmine/vCoolor.vim"] = {},
   ["mrshmllow/document-color.nvim"] = {}, -- for tailwind
   ["nvim-treesitter/playground"] = { after = "nvim-treesitter" },
   -- LSP: config
   ["jose-elias-alvarez/typescript.nvim"] = {}, -- for lsp and tsserver
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.lsp.null-ls")
      end,
   },
   ["neovim/nvim-lspconfig"] = {
      config = function()
         -- require("plugins.configs.lspconfig")
         require("custom.plugins.lsp")
      end,
   },
   ["williamboman/mason.nvim"] = {},
   ["williamboman/mason-lspconfig.nvim"] = {},
   -- para markdown
   ["iamcco/markdown-preview.nvim"] = {
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
         vim.g.mkdp_auto_start = 1
         vim.g.mkdp_auto_close = 0
         vim.keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>")
      end,
   },
   ["gaoDean/autolist.nvim"] = {
      config = function()
         require("autolist").setup({})
      end,
   },
}

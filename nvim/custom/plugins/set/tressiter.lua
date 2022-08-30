require 'nvim-treesitter.configs'.setup {
   ensure_installed = 'all', -- one of "all", or a list of languages
   ignore_install = { 'haskell', 'phpdoc', 'html', 'css', 'scss' },
   highlight = {
      enable = true,
      disable = { 'html', 'css', 'scss' }
      -- disable = { "c", "rust" },  -- list of language that will be disabled
      -- additional_vim_regex_highlighting = false,
   },

   indent = {
      enable = true
   },

   autotag = {
      enable = true,
   },

   rainbow = {
      enable = true,
      extended_mode = true,
   },

   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },

   textobjects = {
      move = {
         enable = true,
         set_jumps = true, -- whether to set jumps in the jumplist
         goto_next_start = {
            ["]]"] = "@function.outer",
            ["]m"] = "@class.outer",
         },
         goto_next_end = {
            ["]["] = "@function.outer",
            ["]M"] = "@class.outer",
         },
         goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer",
         },
         goto_previous_end = {
            ["[]"] = "@function.outer",
            ["[M"] = "@class.outer",
         },
      },
      select = {
         enable = true,

         -- Automatically jump forward to textobj, similar to targets.vim
         lookahead = true,

         keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
         },
      },
      swap = {
         enable = true,
         swap_next = {
            ["~"] = "@parameter.inner",
         },
      },
   },

   textsubjects = {
      enable = true,
      keymaps = {
         ['<cr>'] = 'textsubjects-smart', -- works in visual mode
      }
   },
}

local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

treesitter.setup({
   ensure_installed = {
      "lua",
      "vim",
      "html",
      "css",
      "scss",
      "markdown",
      "markdown_inline",
      "javascript",
      "typescript",
      "json",
      "toml",
      "tsx",
      "cpp",
      "c",
      "svelte",
      "comment",
      "python",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   indent = {
      enable = true,
   },
   autotag = { enable = true },
   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
   playground = { -- modulo de prueva de grupos highlight
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
         toggle_query_editor = "o",
         toggle_hl_groups = "i",
         toggle_injected_languages = "t",
         toggle_anonymous_nodes = "a",
         toggle_language_display = "I",
         focus_language = "f",
         unfocus_language = "F",
         update = "R",
         goto_node = "<cr>",
         show_help = "?",
      },
   },
})

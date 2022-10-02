local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")

if not nvim_tree_ok then
   return
end

local User = require("custom.configs")

function Open_Widht()
   local winwidth = vim.go.columns
   if winwidth <= 130 and not User.NvimTree.windows_float then
      return true
   else
      return false
   end
end

-- +--------------------------------------------------------------------+
-- iconos personalizados
local icons_custom = {
   diagnostics = {
      hint = User.icons.diagnostic.hint,
      info = User.icons.diagnostic.info,
      warning = User.icons.diagnostic.warning,
      error = User.icons.diagnostic.error,
   },
   git = {
      unstaged = User.icons.git.modifier,
      staged = User.icons.git.check,
      unmerged = User.icons.git.unmerged,
      renamed = "➜",
      untracked = User.icons.git.add,
      deleted = User.icons.git.remove,
      ignored = "◌",
   },
   indents = { corner = User.icons.others.curve },
}

-- Atajos de teclado dentro de NvimTree
local keymappings = {
   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
   { key = { "O" }, action = "edit_no_picker" },
   { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
   { key = "<leader>v", action = "vsplit" },
   { key = "<leader>h", action = "split" },
   { key = "P", action = "parent_node" },
   { key = "<BS>", action = "close_node" },
   { key = "<Tab>", action = "preview" },
   { key = "K", action = "first_sibling" },
   { key = "J", action = "last_sibling" },
   { key = "I", action = "toggle_ignored" },
   { key = "H", action = "toggle_dotfiles" },
   { key = "R", action = "refresh" },
   { key = "a", action = "create" },
   { key = "d", action = "remove" },
   { key = "D", action = "trash" },
   { key = "r", action = "rename" },
   { key = "<C-r>", action = "full_rename" },
   { key = "x", action = "cut" },
   { key = "c", action = "copy" },
   { key = "p", action = "paste" },
   { key = "y", action = "copy_name" },
   { key = "Y", action = "copy_path" },
   { key = "gy", action = "copy_absolute_path" },
   { key = "[c", action = "prev_git_item" },
   { key = "]c", action = "next_git_item" },
   { key = "-", action = "dir_up" },
   { key = "s", action = "system_open" },
   { key = "q", action = "close" },
   { key = "g?", action = "toggle_help" },
   { key = "W", action = "collapse_all" },
   { key = "S", action = "search_node" },
}
-- +--------------------------------------------------------------------+

-- NOTE: Configuracion de NvimTree
nvim_tree.setup({
   disable_netrw = false,
   hijack_netrw = true,
   open_on_setup = false,
   ignore_ft_on_setup = {},
   open_on_tab = false, -- Abre el arbol cuando se cambia de buffer o se abro uno
   hijack_cursor = true, -- para tener el cursor un espacio después del nombre
   sort_by = "case_sensitive", -- Como se ordena en directorio: 'name', 'case_sensitive', 'modification_time', 'extension'
   update_cwd = true, -- Cambiar el directorio raiz del arbol en DirChanged
   hijack_unnamed_buffer_when_opening = false,
   respect_buf_cwd = true, -- Cambiar el CWD de NvimTree al nuevo buffer al abrir NvimTree

   diagnostics = { -- Diagnosticos del LSP
      enable = true, -- Habilitar el diagnostico
      icons = icons_custom.diagnostics, -- Iconos de Diagnosticos
   },

   renderer = {
      add_trailing = true, -- Agrega '/' al final del folder
      group_empty = false, -- Compactar Carpetas que solo tienen una carpeta, Problema al agregar o renombrar, por eso lo puse false
      highlight_git = true, -- Habilitar el resaltado de Git.
      highlight_opened_files = "name", -- Resaltado del archivo si este esta abierto. 'none', 'icon', 'name', 'all'
      root_folder_modifier = ":~",
      indent_markers = { -- Indentado
         enable = true, -- Habilitar el indentado
         icons = icons_custom.indents, -- Iconos para el indentado Custom
      },
      icons = { -- Iconos de carpetas, Git
         show = {
            file = true,
            folder = true,
            folder_arrow = false, -- muestra un icono si el folder esta abierto, pero ocupa mas espacio
            git = true,
         },
         glyphs = {
            git = icons_custom.git, -- Iconos de estados de Git
         },
      },
   },

   update_focused_file = {
      enable = true, -- Actualizar el archivo enfocado en 'BufEnter'
      update_cwd = true,
      ignore_list = {},
   },
   system_open = {
      cmd = "",
      args = {},
   },
   filters = {
      dotfiles = true, -- Nom mostrar archivos ocultos, Alternar con 'H' -> toggle_dotfiles
      -- custom = { -- Filtra archivos o ficheros
      --    '.swp', '.pyc', '.git', 'node_modules', '.cache',
      --    '.watchmanconfig', '.ruby-version', 'Gemfile', '.flowconfig',
      --    'buckconfig', '.bundle', '__tests__', 'style.css.map'
      -- }
   },
   git = {
      enable = true, -- Habilita el uso de git
      ignore = false, -- Ignora los archivos dentro de '.gitignore' require git.enable = true
      timeout = 500, -- Mata el proceso de git si tarda demasiado, default 400ms
   },
   actions = {
      use_system_clipboard = true, -- Para usar el portapales
      change_dir = {
         enable = true, -- Cambiar el directorio de trabajo al bambiar de directorio
         global = false, -- cambiar de directorio con :cd
         restrict_above_cwd = false, -- Restringir cambiar a un directorio superior
      },
      open_file = {
         quit_on_open = Open_Widht(), -- Cierra la ventana de NvimTree al seleccionar un elemento
         resize_window = true, -- Redimencionar Ventana
         window_picker = {
            enable = true, -- Para abrir archivos en otro buffer diferente al de NvimTree
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = { -- No seleccionar la lista
               filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
               buftype = { "nofile", "terminal", "help" },
            },
         },
      },
   },
   view = {
      -- width = TREE_WIDTH, -- Ancha de la ventana
      width = User.NvimTree.width,
      float = {
         enable = User.NvimTree.windows_float,
         open_win_config = {
            relative = "editor",
            width = User.NvimTree.width,
            height = User.NvimTree.height,
            row = (vim.api.nvim_list_uis()[1].height - User.NvimTree.height) * 0.4,
            col = (vim.api.nvim_list_uis()[1].width - User.NvimTree.width) * 0.5,
         },
      },
      hide_root_folder = false, -- Ocultar la ruta de trabajo actual
      side = User.NvimTree.position, -- El dado del panel NvimTree
      mappings = {
         custom_only = true, -- Mapeo Personalizado
         list = keymappings, -- configuracion de maps
      },
      number = false, -- Para agrear numero de lineas
      relativenumber = false, -- Un numero relativo a la linea en focus
   },
   trash = {
      cmd = "trash", -- Comando para eliminal elementos, default=>'gio trash'
      require_confirm = true, -- Aviso para aceptar la eliminacion del elemento.
   },
})

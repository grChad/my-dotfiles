-- Import Icons del fichero /lua/icons.lua
local icon_status_ok, icon = pcall(require, 'lua.icons')
if not icon_status_ok then
   return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │  HACK: Variables de aceso rapido y keymaps custom        │
-- ╰──────────────────────────────────────────────────────────╯
local TREE_WIDTH = 33       -- Ancho de la ventana NvimTree
local view_side = 'left'    -- direccion de la ventana NvimTree

local keymappings = {
   { key = {'<CR>', 'o', '<2-LeftMouse>'}, action = 'edit' },
   { key = {'O'},                          action = 'edit_no_picker' },
   { key = {'<2-RightMouse>', '<C-]>'},    action = 'cd' },
   { key = '<C-v>',                        action = 'vsplit' },
   { key = '<C-h>',                        action = 'split' },
   { key = 'P',                            action = 'parent_node' },
   { key = '<BS>',                         action = 'close_node' },
   { key = '<Tab>',                        action = 'preview' },
   { key = 'K',                            action = 'first_sibling' },
   { key = 'J',                            action = 'last_sibling' },
   { key = 'I',                            action = 'toggle_ignored' },
   { key = 'H',                            action = 'toggle_dotfiles' },
   { key = 'R',                            action = 'refresh' },
   { key = 'a',                            action = 'create' },
   { key = 'd',                            action = 'remove' },
   { key = 'D',                            action = 'trash' },
   { key = 'r',                            action = 'rename' },
   { key = '<C-r>',                        action = 'full_rename' },
   { key = 'x',                            action = 'cut' },
   { key = 'c',                            action = 'copy' },
   { key = 'p',                            action = 'paste' },
   { key = 'y',                            action = 'copy_name' },
   { key = 'Y',                            action = 'copy_path' },
   { key = 'gy',                           action = 'copy_absolute_path' },
   { key = '[c',                           action = 'prev_git_item' },
   { key = ']c',                           action = 'next_git_item' },
   { key = '-',                            action = 'dir_up' },
   { key = 's',                            action = 'system_open' },
   { key = 'q',                            action = 'close' },
   { key = 'g?',                           action = 'toggle_help' },
   { key = 'W',                            action = 'collapse_all' },
   { key = 'S',                            action = 'search_node' }
}

-- NOTE: Configuracion de NvimTree
require'nvim-tree'.setup {
   open_on_tab        = false,            -- Abre el arbol cuando se cambia de buffer o se abro uno
   hijack_cursor      = true,             -- para tener el cursor un espacio después del nombre
   sort_by            = 'name',           -- Como se ordena en directorio: 'name', 'case_sensitive', 'modification_time', 'extension'
   update_cwd         = true,             -- Cambiar el directorio raiz del arbol en DirChanged
   respect_buf_cwd    = true,             -- Cambiar el CWD de NvimTree al nuevo buffer al abrir NvimTree

   diagnostics = {                        -- Diagnosticos del LSP
      enable = true,                      -- Habilitar el diagnostico
      icons  = {                          -- Iconos Custom
         hint    = icon.hint,
         info    = icon.info,
         warning = icon.warningTriangle,
         error   = icon.error,
      }
   },
   renderer = {
      add_trailing = true,                -- Agrega '/' al final del folder
      group_empty = false,                -- Compactar Carpetas que solo tienen una carpeta, Problema al agregar o renombrar, por eso lo puse false
      highlight_git = true,               -- Habilitar el resaltado de Git.
      highlight_opened_files = 'all',     -- Resaltado del archivo si este esta abierto. 'none', 'icon', 'name', 'all'
      root_folder_modifier = table.concat { ':t:gs?$?/..', string.rep('            ', 1), string.rep(' ', 500), '?:gs?^??' },
      indent_markers = {                  -- Indentado
         enable = true,                   -- Habilitar el indentado
         icons = {                        -- Iconos para el indentado Custom
            corner = '╰ ',
            edge = '│ ',
            none = '  ',
         },
      },
      icons = {                           -- Iconos de carpetas, Git
         glyphs = {
            git = {                       -- Iconos de estados de Git
               unstaged = icon.gitChange,
               staged = icon.checkSquare,
               unmerged = icon.gitUnmerged,
               renamed = icon.rename,
               untracked = icon.gitAdd,
               deleted = icon.gitRemove,
               ignored = icon.gitIgnore,
            },
         }
      }
   },
   update_focused_file = {
      enable      = true,                 -- Actualizar el archivo enfocado en 'BufEnter'
   },
   filters = {
      dotfiles = false,                   -- Nom mostrar archivos ocultos, Alternar con 'H' -> toggle_dotfiles
      custom = {                          -- Filtra archivos o ficheros
         '.swp', '.pyc', '.git', 'node_modules', '.cache',
         '.watchmanconfig', '.ruby-version', 'Gemfile', '.flowconfig',
         'buckconfig', '.bundle', '__tests__', 'style.css.map'
      }
   },
   git = {
      enable = true,                      -- Habilita el uso de git
      ignore = true,                      -- Ignora los archivos dentro de '.gitignore' require git.enable = true
      timeout = 500,                      -- Mata el proceso de git si tarda demasiado, default 400ms
   },
   actions = {
      use_system_clipboard = true,        -- Para usar el portapales
      change_dir = {
         enable = true,                   -- Cambiar el directorio de trabajo al bambiar de directorio
         global = true,                   -- cambiar de directorio con :cd
         restrict_above_cwd = true,       -- Restringir cambiar a un directorio superior
      },
      open_file = {
         quit_on_open = true,             -- Cierra la ventana de NvimTree al seleccionar un elemento
         resize_window = true,            -- Redimencionar Ventana
         window_picker = {
            enable = true,                -- Para abrir archivos en otro buffer diferente al de NvimTree
            chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
            exclude = {                   -- No seleccionar la lista
               filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
               buftype = { 'nofile', 'terminal', 'help' },
            },
         },
      },
   },
   view = {
      width = TREE_WIDTH,                 -- Ancha de la ventana
      hide_root_folder = false,           -- Ocultar la ruta de trabajo actual
      side = view_side,                   -- El dado del panel NvimTree
      mappings = {
         custom_only = true,              -- Mapeo Personalizado
         list = keymappings               -- configuracion de maps
      },
      number = false,                     -- Para agrear numero de lineas
      relativenumber = false              -- Un numero relativo a la linea en focus
   },
   trash = {
      cmd = 'trash',                      -- Comando para eliminal elementos, default=>'gio trash'
      require_confirm = true              -- Aviso para aceptar la eliminacion del elemento.
   }
}

-- NOTE: color de Folder y FolderName de NvimTRee
vim.cmd('highlight NvimTreeFolderIcon guifg=goldenrod')
vim.cmd('highlight NvimTreeFolderName guifg=goldenrod')
vim.cmd('highlight NvimTreeOpenedFolderName guifg=sienna')

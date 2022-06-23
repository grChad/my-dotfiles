local nvimTree = require('nvim-tree')
if not nvimTree then
    return
end

-- vim.g es para establecer variables globales
local g = vim.g

g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep("            ", 1), string.rep(' ', 500), "?:gs?^??" }
g.nvim_tree_add_trailing = 1 -- agrega '/' al final de los folders
g.vim_tree_follow = 1      -- actualiza el cursor al introducir un buffer.

nvimTree.setup {
    hijack_netrw = true,
    hijack_cursor = true, -- para tener el cursor siempre el inicio del nombre
    sort_by = "name",
    update_cwd = true,

    view = {
        width = 33,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {},
        },
    },

    renderer = {
        indent_markers = {
            enable = false,
        },
        icons = {
            webdev_colors = true,
        },
    },

    update_focused_file = { -- da el foco en las pestañas del buffer
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    ignore_ft_on_setup = { 'dashboard' },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    filters = { -- para excluid directorios o archivos
        dotfiles = false,
        custom = {
            ".swp", ".pyc", ".git", "node_modules", ".cache",
            '.watchmanconfig', '.ruby-version', 'Gemfile', '.flowconfig',
            'buckconfig', '.bundle', '__tests__', 'style.css.map'
        },
        exclude = { '.gitignore' }, -- para no excluirlos
    },

    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },

    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
}

-- color del icono del folder
vim.cmd('highlight NvimTreeFolderIcon guifg=goldenrod')
vim.cmd('highlight NvimTreeFolderName guifg=sienna')
vim.cmd('highlight NvimTreeOpenedFolderName guifg=goldenrod')

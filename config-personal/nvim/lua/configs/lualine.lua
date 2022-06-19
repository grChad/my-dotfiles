local lualine = require('lualine')
if not lualine then
    return
end

local spacer = {
    function()
        return '  '
    end,
    padding = { left = 1, right = 1 },
}

lualine.setup {
    options = {
        -- My theme
        theme = 'onedark-nvim',

        disabled_filetypes = { "NvimTree", "neo-tree" },
        icons_enabled = true,
        component_separators = '│',
        section_separators = '',
        always_divide_middle = true,
        globalstatus = 3,
    },
    sections = {
        lualine_a = { spacer },
        lualine_b = {
            {
                'branch',
                icon = '',
            },
            {
                'diff',
                symbols = { added = " ", modified = "柳", removed = " " }
            },
            {
                'diagnostics',
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
            }
        },
        lualine_x = { 'filetype' },
        lualine_z = {
            {
                'location',
                padding = { left = 0, right = 0 }
            }
        }
    }
}

vim.cmd('highlight WinSeparator guifg=RoyalBlue4')

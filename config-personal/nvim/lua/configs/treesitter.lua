local treesitter = require('nvim-treesitter.configs')
if not treesitter then
    return
end

treesitter.setup {
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = { 'vim', 'css', 'scss' },
    highlight = {
        enable = true,
        disable = { 'vim', 'css', 'scss' },
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { 'vim', 'css', 'scss'}
    },
}



local indentBlankLine = require('indent_blankline')
if not indentBlankLine then
    return
end

indentBlankLine.setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

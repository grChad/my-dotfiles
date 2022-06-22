vim.highlight.create('NormalFloat', { guibg='none', guifg='none' }, false)
vim.highlight.create('FloatBorder', { guibg='none' }, false)
vim.highlight.create('WhichKeyFloat', { guibg='none' }, false)
vim.highlight.create('BufferTabpageFill', { guibg='none' }, false)
vim.highlight.create('VertSplit', { guibg='#16161e', guifg='#16161e' }, false)


-- NOTE: color de Folder y FolderName de NvimTRee
vim.cmd('highlight NvimTreeFolderIcon guifg=goldenrod')
vim.cmd('highlight NvimTreeFolderName guifg=goldenrod')
vim.cmd('highlight NvimTreeOpenedFolderName guifg=sienna')

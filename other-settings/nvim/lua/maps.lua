-- comand leader
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map('i', 'kj', '<esc>', opt)
map('v', 'kj', '<esc>', opt)

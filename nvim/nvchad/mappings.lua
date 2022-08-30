local M = {}

local silent = { silent = true }
local noremap = { noremap = true }
local opts = { noremap = true, silent = true }

function Cmd(str) return '<cmd>' .. str .. '<CR>' end

M.general = {
   n = {
      ['<leader>w'] = {Cmd('write'), 'Save buffer'},
      ['m'] = {Cmd('nohl'), 'Descomentar'}
   },
   i = {
      ['kj'] = { '<esc>', 'Escap', { silent = true } },
      ['KJ'] = { '<esc>', 'Escap', { silent = true } },
   }
}

M.buffer = {
   n = {
      ['<leader>q'] = { Cmd('bdelete'), 'Delete Buffer', opts },
      ['<leader>k'] = { Cmd('bn'), 'Next Buffer', opts },
      ['<leader>j'] = { Cmd('bp'), 'Previous Buffer', opts },
   }
}

return M

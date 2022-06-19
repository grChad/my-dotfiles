-- See: https://github.com/glepnir/galaxyline.nvim
local gl = require('galaxyline')
local condition = require('galaxyline.condition')

local function highlight(group, fg, bg, gui)
   local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)

   if gui ~= nil then
      cmd = cmd .. ' gui=' .. gui
   end

   vim.cmd(cmd)
end

local leftbracket = "" -- Curve.
local rightbracket = "" -- Curve.

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'tagbar'}
local gls = gl.section

local bgcolor = function()
   if EcoVim.colorscheme == 'nightfly' then
      return '#011627'
   else
      return nil;
   end
end

-- NOTE: Los colores para personalizar
local colors = {
   bg              = bgcolor();
   modetext        = '#000000',

   giticon         = '#FF8800',
   gitbg           = '#5C2C2E',
   gittext         = '#FF8800',

   diagerror       = '#F44747',
   diagwarn        = '#FF8800',
   diaghint        = '#4FC1FF',
   diaginfo        = '#FFCC66',

   lspicon         = '#68AF00',
   lspbg           = '#304B2E',
   lsptext         = '#DAA520',

   typeicon        = '#FF8800',
   typebg          = '#5C2C2E',
   typetext        = '#C5C5C5',

   statsicon       = '#FDFFBC',
   statsbg         = '#D076D7',
   statstext       = '#000000',

   lineokfg        = '#000000',
   lineokbg        = '#5080A0',
   linelongerrorfg = '#FF0000',
   linelongwarnfg  = '#FFFF00',
   linelongbg      = '#5080A0',

   shortbg         = '#DAA520',
   shorttext       = '#93272F',
   shorticon1      = '#000000',
   shorticon2      = '#0F510F',

   shortrightbg    = '#3F3F3F',
   shortrighttext  = '#7C4C4E',

   gpsbg           = '#5C00A3',
   gpstext         = '#C5C5C5',

   red             = '#E96363',
   yellow          = '#DCDCAA',
   magenta         = '#D16D9E',
   green           = '#6CBE49',
   orange          = '#FF8800',
   purple          = '#C586C0',
   blue            = '#3A8CD7',
   cyan            = '#4EC9B0'
}

local mode_map = {
   ['n']        = {'#569CD6', 'NORMAL'},
   ['i']        = {'#DAA520', 'INSERT'},
   ['R']        = {'#D16969', 'REPLACE'},
   ['c']        = {'#53C424', 'COMMAND'},
   ['v']        = {'#C586C0', 'VISUAL'},
   ['V']        = {'#C586C0', 'VIS-LN'},
   ['']       = {'#C586C0', 'VIS-BLK'},
   ['s']        = {'#FF8800', 'SELECT'},
   ['S']        = {'#FF8800', 'SEL-LN'},
   ['']       = {'#DCDCAA', 'SEL-BLK'},
   ['t']        = {'#569CD6', 'TERMINAL'},
   ['Rv']       = {'#D16D69', 'VIR-REP'},
   ['rm']       = {'#FF0000', '- More -'},
   ['r']        = {'#FF0000', "- Hit-Enter -"},
   ['r?']       = {'#FF0000', "- Confirm -"},
   ['cv']       = {'#569CD6', "Vim Ex Mode"},
   ['ce']       = {'#569CD6', "Normal Ex Mode"},
   ['!']        = {'#569CD6', "Shell Running"},
   ['ic']       = {'#DCDCAA', 'Insert mode completion |compl-generic|'},
   ['no']       = {'#DCDCAA', 'Operator-pending'},
   ['nov']      = {'#DCDCAA', 'Operator-pending (forced charwise |o_v|)'},
   ['noV']      = {'#DCDCAA', 'Operator-pending (forced linewise |o_V|)'},
   ['noCTRL-V'] = {'#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character'},
   ['niI']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Insert-mode|'},
   ['niR']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Replace-mode|'},
   ['niV']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|'},
   ['ix']       = {'#DCDCAA', 'Insert mode |i_CTRL-X| completion'},
   ['Rc']       = {'#DCDCAA', 'Replace mode completion |compl-generic|'},
   ['Rx']       = {'#DCDCAA', 'Replace mode |i_CTRL-X| completion'},
}

-- ╭──────────────────────────────────────────────────────────╮
-- │  WARNING: galaxyline.section.left                        │
-- ╰──────────────────────────────────────────────────────────╯
gls.left = {}

-- NOTE: Los Modos, 'NORMAL', 'LINE', 'VISUAL'...
table.insert(gls.left, {
   ViModeSpaceOnFarLeft = {
      provider = function() return " " end,
      highlight = {colors.giticon, colors.bg}
   }
})
table.insert(gls.left, {
   ViModeLeft = {
   provider = function()
         highlight('ViModeHighlight', mode_map[vim.fn.mode()][1], colors.bg)
         return leftbracket
      end,
      highlight = 'ViModeHighlight'
   }
})
table.insert(gls.left, {
   ViModeIconAndText = {
      provider = function()
         highlight('GalaxyViMode', colors.modetext, mode_map[vim.fn.mode()][1])

         return ' ' .. mode_map[vim.fn.mode()][2]
      end,
      highlight = 'GalaxyViMode'
   }
})
table.insert(gls.left, {
   ViModeRight = {
      provider = function()
         return rightbracket
      end,
      separator = ' ',
      separator_highlight = 'ViModeHighlight',
      highlight = 'ViModeHighlight'
   }
})

-- NOTE: Git Branch
table.insert(gls.left, {
   GitStart = {
      provider = function() return leftbracket end,
      condition = condition.check_git_workspace,
      highlight = {colors.giticon, colors.bg}
   }
})
table.insert(gls.left, {
   GitIcon = {
      provider = function()
         return ' '
      end,
      condition = condition.check_git_workspace,
      highlight = {colors.modetext, colors.giticon}
   }
})

table.insert(gls.left, {
   GitMid = {
      provider = function() return rightbracket .. ' ' end,
      condition = condition.check_git_workspace,
      highlight = {colors.giticon, colors.gitbg}
   }
})

table.insert(gls.left, {
   GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      separator = ' ',
      separator_highlight = {'NONE', colors.gitbg},
      highlight = {colors.gittext, colors.gitbg}
   }
})

-- NOTE: 'ADD', 'EDIT', 'REMOVE'
table.insert(gls.left, {
   DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.check_git_workspace,
      icon = '  ',
      highlight = {colors.green, colors.gitbg}
   }
})
table.insert(gls.left, {
   DiffModified = {
      provider = 'DiffModified',
      condition = condition.check_git_workspace,
      icon = '  ',
      highlight = {colors.blue, colors.gitbg}
   }
})
table.insert(gls.left, {
   DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.check_git_workspace,
      icon = '  ',
      highlight = {colors.red, colors.gitbg}
   }
})
table.insert(gls.left, {
   EndGit = {
      provider = function() return rightbracket end,
      condition = condition.check_git_workspace,
      separator = " ",
      separator_highlight = {colors.gitbg, colors.bg},
      highlight = {colors.gitbg, colors.bg}
   }
})

-- NOTE: Lsp Client
table.insert(gls.left, {
   LspStart = {
      provider = function() return leftbracket end,
      highlight = {colors.lspicon, colors.bg}
   }
})
table.insert(gls.left, {
   LspIcon = {
      provider = function()
         local name = ""
         if gl.lspclient ~= nil then
            name = gl.lspclient()
         end
         return '' .. name
      end,
      highlight = {colors.modetext, colors.lspicon}
   }
})
table.insert(gls.left, {
   LspMid = {
      provider = function() return rightbracket .. ' ' end,
      highlight = {colors.lspicon, colors.lspbg}
   }
})
table.insert(gls.left, {
   ShowLspClient = {
      provider = 'GetLspClient',
      highlight = {colors.lsptext, colors.lspbg}
   }
})
table.insert(gls.left, {
   LspSpace = {
      provider = function() return ' ' end,
      highlight = {colors.lspicon, colors.lspbg}
   }
})

-- NOTE: Diagnostics Lsp
table.insert(gls.left, {
   DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      separator_highlight = {colors.gitbg, colors.bg},
      highlight = {colors.diagerror, colors.lspbg}
   }
})
table.insert(gls.left, {
   DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.diagwarn, colors.lspbg}
   }
})
table.insert(gls.left, {
   DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {colors.diaghint, colors.lspbg}
   }
})
table.insert(gls.left, {
   DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.diaginfo, colors.lspbg}
   }
})
table.insert(gls.left, {
   LspSectionEnd = {
      provider = function() return rightbracket .. " " end,
      highlight = {colors.lspbg, colors.bg}
   }
})


-- ╭──────────────────────────────────────────────────────────╮
-- │  WARNING: galaxyline.section.right                       │
-- ╰──────────────────────────────────────────────────────────╯
gls.right = {}

-- NOTE: Icono y nombre del archivo.
table.insert(gls.right, {
   TypeStart = {
      provider = function() return leftbracket end,
      highlight = {colors.typeicon, colors.bg}
   }
})
table.insert(gls.right, {
   FileIcon = { -- El icono del archivo
      provider = 'FileIcon',
      highlight = {colors.modetext, colors.typeicon}
   }
})
table.insert(gls.right, {
   FileName = { -- El Nombre del archivo
      provider = 'FileName',
      highlight = {'#173963', colors.typeicon}
   }
})
table.insert(gls.right, {
   TypeSectionEnd = {
      provider = function() return rightbracket end,
      highlight = {colors.typeicon, colors.bg}
   }
})


table.insert(gls.right, {
   Space = {
      provider = function() return ' ' end,
      highlight = {colors.typebg, colors.bg}
   }
})

-- NOTE: Cursor Position Section
table.insert(gls.right, {
   StatsSectionStart = {
      provider = function() return leftbracket end,
      highlight = {colors.statsbg, colors.bg}
   }
})
table.insert(gls.right, {
   PerCent = {
      provider = 'LinePercent',
      highlight = {colors.statsicon, colors.statsbg}
   }
})
table.insert(gls.right, {
   VerticalPosAndSize = {
      provider = function()
         return string.format("%2i:%1i", vim.fn.line('.'), vim.fn.col('.'))
      end,
      highlight = {colors.statstext, colors.statsbg}
   }
})



table.insert(gls.right, {
   StatsMid = {
      provider = function() return rightbracket .. ' ' end,
      highlight = {colors.statsbg, colors.bg}
   }
})

-- ╭──────────────────────────────────────────────────────────╮
-- │  WARNING: galaxyline.section.short_line_left             │
-- ╰──────────────────────────────────────────────────────────╯
gls.short_line_left={}

table.insert(gls.short_line_left, {
   ShortSectionStart = {
      provider = function() return '        ' ..leftbracket end,
      highlight = {colors.shortbg, colors.bg}
   }
})
table.insert(gls.short_line_left, {
   ShortSectionSpace = {
      provider = function() return "   "  end,
      highlight = {colors.shorticon1, colors.shortbg}
   }
})
table.insert(gls.short_line_left, {
   LeftShortName = {
      provider = 'FileTypeName',
      highlight = {colors.shorttext, colors.shortbg},
   }
})
table.insert(gls.short_line_left, {
   ShortSectionMid = {
      provider = function() return "   " end,
      highlight = {colors.shorticon2, colors.shortbg}
   }
})
table.insert(gls.short_line_left, {
   LeftShortFileName = {
      provider = 'SFileName',
      condition = condition.buffer_not_empty,
      separator_highlight = {colors.shorttext, colors.shortbg},
      highlight = {colors.shorttext, colors.shortbg},
   }
})
table.insert(gls.short_line_left, {
   ShortSectionEnd = {
      provider = function() return rightbracket end,
      highlight = {colors.shortbg, colors.bg}
   }
})

-- ╭──────────────────────────────────────────────────────────╮
-- │  WARNING: galaxyline.section.short_line_right            │
-- ╰──────────────────────────────────────────────────────────╯
gls.short_line_right = {}

table.insert(gls.short_line_right, {
   BufferIcon = {
      provider = 'BufferIcon',
      separator_highlight = {colors.shorttext, colors.bg},
      highlight = {colors.shortbg, colors.bg}
   }
})

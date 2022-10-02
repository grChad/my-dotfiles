-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
local iconos = require("custom.iconos")

local status_ok, galaxyline = pcall(require, "galaxyline")
if not status_ok then
   return
end

local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.provider_fileinfo")
local gls = galaxyline.section
galaxyline.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

local leftBracket = iconos.separators.round.left -- Curve.
local rightBracket = iconos.separators.round.right -- Curve.
local iconSeparator = iconos.separators.line.favorite

local function highlight(group, fg, bg, gui)
   local cmd = string.format("highlight %s guifg=%s guibg=%s", group, fg, bg)
   if gui ~= nil then
      cmd = cmd .. " gui=" .. gui
   end
   vim.cmd(cmd)
end

local get_lsp_client = function(msg)
   msg = msg or "-"
   local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
   local clients = vim.lsp.get_active_clients()
   if next(clients) == nil then
      return msg
   end
   local lsps = ""
   for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
         if lsps == "" then
            lsps = client.name
         else
            if not string.find(lsps, client.name) then
               lsps = lsps .. ", " .. client.name
            end
         end
      end
   end
   if lsps == "" then
      return msg
   else
      return lsps
   end
end

local color_base46 = require("base46").get_theme_tb("base_30")
local color_custom = require("custom.theme.colors")

local colors = {
   bg = "#1D2024",
   bg_2 = "#34384C",
   text_dark = "#181818",
   text_light = "#C5C5C5",
   text_lsp = "#F2C260",
   text_blue = "#51afef",

   giticon = "#EF7028",
   gitAdd = color_custom.green,
   gitDelete = color_custom.red,
   gitChange = color_custom.yellow,

   -- lspDiagError = '#F56E6E',
   -- lspDiagWarn  = '#E2B55A',
   -- lspDiagHint  = '#dc8ef3',
   -- lspDiagInfo  = '#4FC1FF',

   lspDiagError = color_base46.red,
   lspDiagWarn = color_base46.yellow,
   lspDiagHint = color_base46.purple,
   lspDiagInfo = color_base46.green,
}

local mode_map = {
   ["n"] = { "#DAA520", "NORMAL" },
   ["i"] = { "#569CD6", "INSERT" },
   ["R"] = { "#DA6A73", "REPLACE" },
   ["c"] = { "#98c379", "COMMAND" },
   ["v"] = { "#79dac8", "VISUAL" },
   ["V"] = { "#79dac8", "VIS-LN" },
   [""] = { "#79dac8", "VIS-BLK" },
   ["s"] = { "#FF8800", "SELECT" },
   ["S"] = { "#FF8800", "SEL-LN" },
   [""] = { "#DCDCAA", "SEL-BLK" },
   ["t"] = { "#569CD6", "TERMINAL" },
   ["Rv"] = { "#D16D69", "VIR-REP" },
   ["rm"] = { "#FF0000", "- More -" },
   ["r"] = { "#FF0000", "- Hit-Enter -" },
   ["r?"] = { "#FF0000", "- Confirm -" },
   ["cv"] = { "#569CD6", "Vim Ex Mode" },
   ["ce"] = { "#569CD6", "Normal Ex Mode" },
   ["!"] = { "#569CD6", "Shell Running" },
   ["ic"] = { "#DCDCAA", "Insert mode completion |compl-generic|" },
   ["no"] = { "#DCDCAA", "Operator-pending" },
   ["nov"] = { "#DCDCAA", "Operator-pending (forced charwise |o_v|)" },
   ["noV"] = { "#DCDCAA", "Operator-pending (forced linewise |o_V|)" },
   ["noCTRL-V"] = { "#DCDCAA", "Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character" },
   ["niI"] = { "#DCDCAA", "Normal using |i_CTRL-O| in |Insert-mode|" },
   ["niR"] = { "#DCDCAA", "Normal using |i_CTRL-O| in |Replace-mode|" },
   ["niV"] = { "#DCDCAA", "Normal using |i_CTRL-O| in |Virtual-Replace-mode|" },
   ["ix"] = { "#DCDCAA", "Insert mode |i_CTRL-X| completion" },
   ["Rc"] = { "#DCDCAA", "Replace mode completion |compl-generic|" },
   ["Rx"] = { "#DCDCAA", "Replace mode |i_CTRL-X| completion" },
}

-- ┌                                                                    ┐
-- │                           SECTION: left                            │
-- └                                                                    ┘
gls.left = {}

table.insert(gls.left, {
   SpaceBlankInit = {
      provider = function()
         return " "
      end,
   },
})
-- +--------------------------------------------------------------------+
local HideInNoFile = function()
   local tbl = { ["dashboard"] = true, [""] = true }
   if tbl[vim.bo.filetype] then
      return true
   end
   return false
end

local ShowFile = function()
   local tbl = { ["dashboard"] = true, [""] = true }
   if tbl[vim.bo.filetype] == nil then
      return true
   end
   return false
end

-- Parte del modo Vi
table.insert(gls.left, {
   ViModeLeft = {
      provider = function()
         highlight("GalaxyModeNvim", colors.text_dark, mode_map[vim.fn.mode()][1], "bold")
         return " "
      end,
      highlight = "GalaxyModeNvim",
   },
})

table.insert(gls.left, {
   ViMode = {
      provider = function()
         return mode_map[vim.fn.mode()][2]
      end,
      highlight = "GalaxyModeNvim",
   },
})

table.insert(gls.left, {
   ViModeRightShow = {
      condition = ShowFile,
      provider = function()
         highlight("ModeNvimRight", mode_map[vim.fn.mode()][1], colors.bg)
         return rightBracket
      end,
      highlight = "ModeNvimRight",
      separator = " ",
      separator_highlight = { colors.bg, colors.bg },
   },
})

table.insert(gls.left, {
   ViModeRightHide = {
      condition = HideInNoFile,
      provider = function()
         highlight("ModeNvimRight2", mode_map[vim.fn.mode()][1], colors.bg_2)
         return rightBracket
      end,
      highlight = "ModeNvimRight2",
   },
})
-- +--------------------------------------------------------------------+
-- Parte del peso del archivo
table.insert(gls.left, {
   FileSize = {
      condition = condition.buffer_not_empty,
      provider = "FileSize",
      highlight = { colors.giticon, colors.bg },
      separator = iconSeparator .. " ",
      separator_highlight = { colors.text_light, colors.bg },
   },
})
-- +--------------------------------------------------------------------+
-- Parte del icono y nombre del archivo
table.insert(gls.left, {
   FileIcon = {
      condition = condition.buffer_not_empty,
      highlight = { fileinfo.get_file_icon_color, colors.bg },
      provider = "FileIcon",
   },
})

table.insert(gls.left, {
   FileName = {
      condition = condition.buffer_not_empty,
      highlight = { colors.text_light, colors.bg, "bold" },
      provider = "FileName",
   },
})
-- +--------------------------------------------------------------------+
-- LSP indicator
table.insert(gls.left, {
   DiagnosticError = {
      highlight = { colors.lspDiagError, colors.bg },
      icon = iconos.diagnostic.error .. " ",
      provider = "DiagnosticError",
   },
})

table.insert(gls.left, {
   DiagnosticWarn = {
      highlight = { colors.lspDiagWarn, colors.bg },
      icon = iconos.diagnostic.warning .. " ",
      provider = "DiagnosticWarn",
   },
})

table.insert(gls.left, {
   DiagnosticHint = {
      highlight = { colors.lspDiagHint, colors.bg },
      icon = iconos.diagnostic.hint .. " ",
      provider = "DiagnosticHint",
   },
})

table.insert(gls.left, {
   DiagnosticInfo = {
      highlight = { colors.lspDiagInfo, colors.bg },
      icon = iconos.diagnostic.info .. " ",
      provider = "DiagnosticInfo",
   },
})

-- ┌                                                                    ┐
-- │                           SECTION: media                           │
-- └                                                                    ┘
gls.mid = {}

local HideInWidthComplete = function()
   local tbl = { ["dashboard"] = true, [""] = true }
   if condition.hide_in_width() then
      if tbl[vim.bo.filetype] then
         return false
      end
      return true
   end
end

table.insert(gls.mid, {
   LeftLspClient = {
      condition = HideInWidthComplete,
      provider = function()
         return leftBracket
      end,
      highlight = { colors.bg, colors.bg_2 },
   },
})

table.insert(gls.mid, {
   ShowLspClient = {
      condition = HideInWidthComplete,
      highlight = { colors.text_lsp, colors.bg, "bold" },
      icon = "  ",
      provider = get_lsp_client,
   },
})

table.insert(gls.mid, {
   RightLspClient = {
      condition = HideInWidthComplete,
      provider = function()
         return rightBracket
      end,
      highlight = { colors.bg, colors.bg_2 },
   },
})

-- ┌                                                                    ┐
-- │                           SECTION: right                           │
-- └                                                                    ┘
gls.right = {}

-- Git, iconos para cambios en el documento
table.insert(gls.right, {
   LeftSeparatorGit = {
      provider = function()
         return " "
      end,
      highlight = { colors.bg, colors.bg },
   },
})

table.insert(gls.right, {
   DiffAdd = {
      icon = iconos.git.add .. " ",
      provider = "DiffAdd",
      highlight = { colors.gitAdd, colors.bg },
   },
})

table.insert(gls.right, {
   DiffModified = {
      icon = iconos.git.modifier .. " ",
      provider = "DiffModified",
      highlight = { colors.gitChange, colors.bg },
   },
})

table.insert(gls.right, {
   DiffRemove = {
      icon = iconos.git.remove .. " ",
      provider = "DiffRemove",
      highlight = { colors.gitDelete, colors.bg },
   },
})

-- Git Brach
table.insert(gls.right, {
   GitIcon = {
      provider = function()
         return iconos.git.branch .. " "
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.giticon, colors.bg, "bold" },
   },
})

table.insert(gls.right, {
   GitBranch = {
      condition = condition.check_git_workspace,
      provider = "GitBranch",
      highlight = { colors.text_light, colors.bg, "bold" },
   },
})

-- Para cuando no este en uso Git, se agregara FileFormal 'unix'
local NoGitWorkspace = function()
   if condition.check_git_workspace() then
      return false
   end
   return true
end

table.insert(gls.right, {
   IconsInUnix = {
      condition = NoGitWorkspace,
      provider = function()
         return "  "
      end,
      highlight = { colors.text_light, colors.bg },
   },
})

table.insert(gls.right, {
   FileFormatSinGit = {
      condition = NoGitWorkspace,
      provider = "FileFormat",
      highlight = { colors.giticon, colors.bg },
   },
})

-- Posicion del cursor en el documento
table.insert(gls.right, {
   SeparatorLeftPosition = {
      provider = function()
         highlight("ModeNvimLeftIcon", mode_map[vim.fn.mode()][1], colors.bg)
         return leftBracket
      end,
      highlight = "ModeNvimLeftIcon",
      separator = " ",
      separator_highlight = { colors.bg, colors.bg },
   },
})

table.insert(gls.right, {
   PerCent = {
      provider = "LinePercent",
      highlight = "GalaxyModeNvim",
   },
})

table.insert(gls.right, {
   LineColumnColorVi = {
      provider = "LineColumn",
      highlight = "GalaxyModeNvim",
      separator = iconSeparator,
      separator_highlight = "GalaxyModeNvim",
   },
})

-- espacion final sin highlight
table.insert(gls.right, {
   SpaceBlankEnd = {
      provider = function()
         return " "
      end,
   },
})

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ╏                      SECTION: Short line left                      ╏
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
gls.short_line_left = {}

table.insert(gls.short_line_left, {
   SpaceInitShort = {
      provider = function()
         return " "
      end,
      separator = " ",
      separator_highlight = { colors.text_blue, colors.text_blue },
   },
})

table.insert(gls.short_line_left, {
   BlankSpaceShortRight = {
      provider = function()
         return " "
      end,
      highlight = { colors.bg, colors.bg },
   },
})

local List_Name_color = {
   ["NvimTree"] = true,
   ["vista"] = true,
   ["dbui"] = true,
   ["packer"] = true,
}

table.insert(gls.short_line_left, {
   BufferType = {
      condition = function()
         if List_Name_color[vim.bo.filetype] then
            return false
         end
         return true
      end,
      provider = "FileTypeName",
      highlight = { colors.text_blue, colors.bg, "bold" },
   },
})

table.insert(gls.short_line_left, {
   BufferTypeNvimTree = {
      condition = function()
         if List_Name_color[vim.bo.filetype] then
            return true
         end
         return false
      end,
      provider = "FileTypeName",
      highlight = { colors.gitChange, colors.bg, "bold" },
   },
})

table.insert(gls.short_line_left, {
   InternalSpace = {
      provider = function()
         return " "
      end,
      highlight = { colors.bg, colors.bg },
   },
})

table.insert(gls.short_line_left, {
   SFileName = {
      condition = condition.buffer_not_empty,
      provider = "SFileName",
      highlight = { colors.text_light, colors.bg, "bold" },
   },
})

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ╏                     SECTION: Short line right                      ╏
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
gls.short_line_right = {}

table.insert(gls.short_line_right, {
   BufferIcon = {
      provider = "BufferIcon",
      highlight = { colors.gitChange, colors.bg },
   },
})

table.insert(gls.short_line_right, {
   SpaceEndShort = {
      provider = function()
         return " "
      end,
      separator = " ",
      separator_highlight = { colors.text_blue, colors.text_blue },
   },
})

local M = {}

M.uiChad = {
   tabufline = {
      enabled = false,
      lazyload = true,
      overriden_modules = nil,
   },
}

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

M.cmp_change = {
   window = {
      completion = {
         border = border("FloatBorder"),
         winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
         border = border("FloatBorder"),
         winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
   },
   experimental = {
      ghost_text = true,
   },
}

M.git_signs = {
   signs = {
      add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
   },
}

return M
